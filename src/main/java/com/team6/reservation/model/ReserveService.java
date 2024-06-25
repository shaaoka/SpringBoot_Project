package com.team6.reservation.model;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.nio.charset.StandardCharsets;
import java.time.LocalDate;
import java.util.List;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.FileSystemResource;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.scheduling.annotation.Async;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import jakarta.mail.MessagingException;
import jakarta.mail.internet.MimeMessage;

@Service
@Transactional
public class ReserveService {
	//沒問題
	@Autowired
	private ReserveRepository reserveRepository;
	@Autowired
	private JavaMailSender mailSender; 
	
	public List<Reserve> checkInByName(String name,String date){	
		return reserveRepository.checkInByName(name,date);
	}
	
	public List<Reserve> checkInByPhone(String phone){
		return reserveRepository.checkInByPhone(phone);
	}
	
	public List<Reserve> selectReservationData(String date){
		return reserveRepository.selectReservationData(date);
	}
	
	public List<Reserve> selectReservationStatus(){
		return reserveRepository.selectReservationStatus();
	}
	
	public int selectAllCheckedCounts() {
	    LocalDate currentDate = LocalDate.now();       
	    String currentDateAsString = currentDate.toString();
	    Integer result = reserveRepository.selectAllCheckedCounts(currentDateAsString);
	    return (result != null) ? result : 0;
	}
	
	public List<Reserve> selectAllChecked(){
	    LocalDate currentDate = LocalDate.now();       
	    String currentDateAsString = currentDate.toString();
	    return reserveRepository.selectAllChecked(currentDateAsString);
	}
	
	public int selectReservationStatusCounts() {
		return reserveRepository.selectReservationStatusCounts();
	}
	
	public void updateNumberOfPeople(int reservationId, int newNumberOfPeople) {
		reserveRepository.updateNumberOfPeople(reservationId, newNumberOfPeople);
	}

	public void updateReservationDate(int reservationId, String reservation_date) {
		reserveRepository.updateReservationDate(reservationId, reservation_date);
	}
		
	public void updateReservationTime(int reservationId, String reservation_time) {		
		reserveRepository.updateReservationTime(reservationId, reservation_time);
	}
	
	public void deleteReservation(int reservationId) {
		reserveRepository.deleteReservation(reservationId);
	}
	
	public void updateReservationStatus(int reservation_id) {
		reserveRepository.updateReservationStatus(reservation_id);		
	}
	
	//客人點選:明天會報到
	public void updateReservationStatusTo3(UUID reservationUuid) {
		reserveRepository.updateReservationStatusTo3(reservationUuid);
	}
	
	//客人點選:明天不會報到或無回應
	public void updateReservationStatusTo2(UUID reservationUuid) {
		reserveRepository.updateReservationStatusTo2(reservationUuid);
	}
	
	//客人點選:臨時修改人數且明天會報到(來自customerConfirm.html)
	public void updateNumberOfPeopleAndReservationStatusTo3(UUID reservationUuid, int newNumberOfPeople) {
		reserveRepository.updateNumberOfPeopleAndReservationStatusTo3(reservationUuid, newNumberOfPeople);
	}

	//customerConfirm.html(呈現客人rs=1,cs=0訂位資訊讓客人確認)
	public Reserve selectCustomerTommorowComeOrNot(UUID reservationUuid) {
		return reserveRepository.selectCustomerTommorowComeOrNot(reservationUuid);	 
	}
	
	//系統掃描rs=1,cs=0的客人是否有 reservationDate - localdate = 1 的客人
	@Async
	public void selectCustomerTommorowReservation() {
		List<Reserve> tomorrowReservations = reserveRepository.selectCustomerTommorowReservation();
		
	    if (!tomorrowReservations.isEmpty()) {
	        for (Reserve reservation : tomorrowReservations) {  

					String reservationName = reservation.getReservationName();
					String reservationDate = reservation.getReservationDate();
					String reservationTime = reservation.getReservationTime();
					int numberOfPeople = reservation.getNumberOfPeople();
					
					//不轉成string，過一段時間UUID會變成null
		            String reservationUuid = reservation.getReservationUUID().toString();
		           
		            String mail = reservation.getMail();
		            				
		            String confirmationLink = "http://localhost:8080/reservation/customerComfirmto3?reservationUuid=" + reservationUuid;
		            String updateNumberOfPeopleAndConfirmLink = "http://localhost:8080/reservation/selectCustomerTommorowComeOrNot?reservationUuid=" + reservationUuid;
		            String rejectionLink = "http://localhost:8080/reservation/customerComfirmto2?reservationUuid=" + reservationUuid;
					
		            String receivers = mail;
					String subject ="請確認明日訂位";
					String from = "DonerPizza<h60915@gmail.com>";
					String content = "<html><body style=\"font-family: Arial, sans-serif; background-color: #f9f9f9; padding: 20px;\">" +
			                "<div style=\"max-width: 600px; margin: auto; background: #fff; padding: 20px; border-radius: 10px; box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);\">" +
			                "<h2 style=\"text-align: center; color: #333;\">訂位確認通知</h2>" +
			                "<p>親愛的 <strong>" + reservationName + " 先生/小姐</strong>，您好！</p>" +
			                "<p>感謝您選擇 DonerPizza！</p>" +
			                "<p>以下是您的訂位資訊：</p>" +
			                "<table style=\"width: 100%;\">" +
			                "<tr><td><strong>預訂時間：</strong></td><td>" + reservationDate + " " + reservationTime + "</td></tr>" +
			                "<tr><td><strong>用餐人數：</strong></td><td>" + numberOfPeople + " 位</td></tr>" +
			                "</table>" +
			                "<p>若您確定會前來用餐，請點擊以下按鈕進行確認：</p>" +
			                "<a href=\"" + confirmationLink + "\" style=\"display: block; background-color: #ff6347; color: white; padding: 10px 20px; text-decoration: none; border-radius: 5px; text-align: center;\">確認訂位</a>" +
			                "<p>若您無法前來用餐，請點擊以下按鈕進行取消訂位：</p>" +
			                "<a href=\"" + rejectionLink + "\" style=\"display: block; background-color: #ff6347; color: white; padding: 10px 20px; text-decoration: none; border-radius: 5px; text-align: center;\">取消訂位</a>" +
			                "<p>如果您需要更改人數，請點擊以下按鈕：</p>" +
			                "<a href=\"" + updateNumberOfPeopleAndConfirmLink + "\" style=\"display: block; background-color: #ff6347; color: white; padding: 10px 20px; text-decoration: none; border-radius: 5px; text-align: center;\">更改人數</a>" +
			                "<p>祝您用餐愉快！</p>" +
			                "</div>" +
			                "</body></html>";

					sendSimpleHtml(from, receivers, subject, content);
		            }         
	    } else {
	    	System.out.println("寄送明日確認信件失敗🤯🤯");
	        return;
	    }
	}
	
	//customerReserveCheck.jsp(讓客人看到自己的訂位狀態和用餐狀態)
	public Reserve customerReserveCheck(UUID reservationUuid) {
		Reserve customerReserveCheck = reserveRepository.customerReserveCheck(reservationUuid);
		return customerReserveCheck;
	}
		
	//ispanTeam2要改成會員帳號
	public Reserve InsertReservation(String ispan6,UUID reservationUuid ,int numberOfPeople, String reservationDate, String phone,String mail ,String reservationTime, String note, String reservationName) {
		Reserve reserve = new Reserve();
        try {
            reserve.setAccount(ispan6);
            reserve.setReservationUUID(reservationUuid);
            reserve.setNumberOfPeople(numberOfPeople);
            reserve.setReservationName(reservationName);
            reserve.setPhone(phone);
            reserve.setMail(mail);
            reserve.setReservationTime(reservationTime);
            reserve.setReservationDate(reservationDate);
            reserve.setNote(note);
            reserve.setReservationStatus(0);
            reserve.setCheckInStatus(0);
            reserve = reserveRepository.save(reserve);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return reserve;
    }
	
	//為現場客人新增資料
	public Reserve InsertDineInCustomer(String ispanTeam2, int numberOfPeople, String reservationDate, String reservationTime, String note) {
		Reserve reserve = new Reserve();
        try {
            reserve.setAccount(ispanTeam2);
            reserve.setNumberOfPeople(numberOfPeople);
            reserve.setReservationName("現場用餐");
            reserve.setPhone("");
            reserve.setReservationTime(reservationTime);
            reserve.setReservationDate(reservationDate);
            reserve.setNote(note);
            reserve.setReservationStatus(4);
            reserve.setCheckInStatus(1);
            reserve = reserveRepository.save(reserve);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return reserve;
    }
			
	public void updateCheckInStatus(int reservation_id) {
		reserveRepository.updateCheckInStatus(reservation_id);
	}
	public void deleteCheckInStatus(int reservation_id) {
		reserveRepository.deleteCheckInStatus(reservation_id);
	}
	
	//待確認預訂訊息-刪除:將rs=5(店家不接該筆預定)
	public void updateReservationStatusTo5(int reservationId) {
		reserveRepository.updateReservationStatusTo5(reservationId);
	}
	
	//客人吃飽了:將cs由1改為2,rs=3~4
	public void deleteCheckInStatusTo2(int reservation_id) {
		reserveRepository.deleteCheckInStatusTo2(reservation_id);
	}

	//查詢歷史訂位(依年月)用來匯出CSV
	public List<Reserve> selectHistoryReservation(String year,String month){
		return reserveRepository.selectHistoryReservation(year,month);
	}
	
	//分頁:查詢歷史訂位(依年月)且日期時間由小到大
	public Page<Reserve> selectPageHistoryReservation(String year,String month,Pageable pageable){
	return reserveRepository.selectPageHistoryReservation(year,month,pageable);
	}	
	
	//手動修改客人預訂狀態
	public void autoUpdateReservationStatus(int reservationStatus,int reservationId ) {
		reserveRepository.autoUpdateReservationStatus(reservationStatus, reservationId);
	}

	//匯出成csv
	public void saveDetailToCSV(String year, String month) {
	    String file = "C:\\Users\\User\\Downloads\\" + year + month + "歷史訂位紀錄.csv";
	    String CSV = "編號,訂位編號,會員帳號,訂位姓名,電話,Email,訂位人數,訂位日期,訂位時間,訂位狀態,備註\n";

	    List<Reserve> reserves = reserveRepository.selectHistoryReservation(year, month);
	    //寫在try-with-reosurce-block內不用自己close
	    try (FileOutputStream fos = new FileOutputStream(file);
	         BufferedOutputStream bos = new BufferedOutputStream(fos)) {
	        bos.write(new byte[] { (byte) 0xEF, (byte) 0xBB, (byte) 0xBF });
	        
	        int counter = 1; // 編號從1開始
	        for (Reserve reserve : reserves) {
	            CSV += counter++ + "," + reserve.saveToCsv() + "\n";
	        }
	        
	        byte[] bytes = CSV.getBytes(StandardCharsets.UTF_8);
	        bos.write(bytes);
	    } catch (Exception e) {
	        e.printStackTrace();
	    }
	}

	    
   // 自動寄信用(HTML信件)
	@Async
    public void sendSimpleHtml(String from, String receiver, String subject, String content) {
    	MimeMessage message = mailSender.createMimeMessage();
    	FileSystemResource fileSystemResource = new FileSystemResource(
    	        new File("src/main/resources/static/images/reservation/menu.jpeg"));

		try {
			MimeMessageHelper helper = new MimeMessageHelper(message, true);
			helper.setFrom(from);
			helper.setTo(receiver);
			helper.setSubject(subject);
			helper.setText(content, true);
			helper.addInline("menu", fileSystemResource);
		} catch (MessagingException me) {
			me.printStackTrace();
		}
		mailSender.send(message);	
    }
       
	//會員端:提供客人查詢自己的訂位紀錄
	public List<Reserve> selectHistoryReservationByCustomer(String account){
		return reserveRepository.selectHistoryReservationByCustomer(account);
	}	
	
//	//自動寄信用(純文字信)
//    public void sendPlainText(String receivers, String subject, String content, String from) {
//        SimpleMailMessage message = new SimpleMailMessage();
//        message.setTo(receivers);
//        message.setSubject(subject);
//        message.setText(content);
//        message.setFrom(from);
//
//        mailSender.send(message);
//    }
	
//	//分頁:查詢歷史訂位(依年月)且日期由大到小(未用)
//	public Page<Reserve> selectPageHistoryReservationByDESC(String year,String month,Pageable pageable ){
//	return reserveRepository.selectPageHistoryReservationByDESC(year,month,pageable);
//	}
}