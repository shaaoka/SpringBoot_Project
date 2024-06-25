package com.team6.delivery.model;

import java.io.FileOutputStream;
import java.io.FileWriter;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.List;

import java.util.Optional;

import org.apache.poi.ss.usermodel.Row;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.thoughtworks.xstream.XStream;
import com.thoughtworks.xstream.io.xml.DomDriver;
import org.apache.poi.ss.usermodel.*;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;


@Service
@Transactional
public class DeliveryService {

	@Autowired
	private DeliveryRepository dRepos;

	//========================= 外送單功能 =============================//
	//查詢所有外送單資料
	public List<Delivery> FindAll(){
		return dRepos.findAll();
	}
	//查詢單筆外送單資料
	public Delivery FindById(Integer id) {
		Optional<Delivery> op1 = dRepos.findById(id);
		if(op1.isPresent()) {
			return op1.get();
		}
		return null;	
	}
	//更新外送單資料
	public Delivery Update(Delivery delivery) {
		return dRepos.save(delivery);
	}
	//更新外送訂單
	public void UpdDeliveryOrderAll() {
		dRepos.upddeliveyall();;
	}	
	//刪除單筆外送單資料
	public void DelDelivery(int id) {
		dRepos.deleteById(id);
	}
	//新增外送單資料
	public Delivery Insert(Delivery delivery){
		return dRepos.save(delivery);
	}
	//========================= 資料匯出功能 =============================//
	//儲存JSON檔案
	public void SaveJson() {
		Gson gson = new GsonBuilder().setPrettyPrinting().create();
		List<Delivery> data = dRepos.findAll();
		String json = gson.toJson(data);

		//	    String folderPath = "C:/JSON";
		String folderPath = "C:/Users/User/Downloads";
		String fileName = "外送單資料.json";

		// 檢查並創建目標文件夾
		try {
			Path path = Paths.get(folderPath);
			if (!Files.exists(path)) {
				Files.createDirectories(path);
			}

			// 構建完整的文件路徑
			String filePath = folderPath + "/" + fileName;

			// 寫入JSON數據到文件
			try (FileWriter writer = new FileWriter(filePath)) {
				writer.write(json);
				System.out.println("JSON數據已成功寫入到文件：" + filePath);
			} catch (IOException e) {
				System.err.println("無法寫入JSON數據到文件：" + filePath);
				e.printStackTrace();
			}

		} catch (IOException e) {
			System.err.println("無法創建目標文件夾：" + folderPath);
			e.printStackTrace();
		}
	}
	//儲存xml檔案
	public void SaveXml() {
		XStream xstream = new XStream(new DomDriver());
		List<Delivery> data = dRepos.findAll();

		// 設定別名 (alias) 以便在 XML 中使用指定的標籤名稱
		xstream.alias("delivery", Delivery.class);

		String xml = xstream.toXML(data);

		//	    String folderPath = "C:/XML";
		String folderPath = "C:/Users/User/Downloads";
		String fileName = "外送單資料.xml";

		// 檢查並創建目標文件夾
		try {
			Path path = Paths.get(folderPath);
			if (!Files.exists(path)) {
				Files.createDirectories(path);
			}

			// 構建完整的文件路徑
			String filePath = folderPath + "/" + fileName;

			// 寫入 XML 數據到文件
			try (FileWriter writer = new FileWriter(filePath)) {
				writer.write(xml);
				System.out.println("XML 數據已成功寫入到文件：" + filePath);
			} catch (IOException e) {
				System.err.println("無法寫入 XML 數據到文件：" + filePath);
				e.printStackTrace();
			}

		} catch (IOException e) {
			System.err.println("無法創建目標文件夾：" + folderPath);
			e.printStackTrace();
		}
	}
	//儲存Excel檔案
	public void SaveExcel() {
		List<Delivery> data = dRepos.findAll();

		//	    String folderPath = "C:/EXCEL";
		String folderPath = "C:/Users/User/Downloads";
		String fileName = "外送單資料.xlsx";

		// 檢查並創建目標文件夾
		try {
			Path path = Paths.get(folderPath);
			if (!Files.exists(path)) {
				Files.createDirectories(path);
			}

			// 構建完整的文件路徑
			String filePath = folderPath + "/" + fileName;

			// 建立新的 Excel 工作簿

			Workbook workbook = new XSSFWorkbook();
			Sheet sheet = workbook.createSheet("Delivery Data");

			// 創建標題行
			Row headerRow = sheet.createRow(0);
			headerRow.createCell(0).setCellValue("外送訂單");
			headerRow.createCell(1).setCellValue("日期");
			headerRow.createCell(2).setCellValue("地址");
			headerRow.createCell(3).setCellValue("外送員工");
			headerRow.createCell(4).setCellValue("外送開始時間");
			headerRow.createCell(5).setCellValue("外送結束時間");

			// 填入資料
			int rowNum = 1;
			for (Delivery delivery : data) {
				Row row = sheet.createRow(rowNum++);
				row.createCell(0).setCellValue(delivery.getId());
				row.createCell(1).setCellValue(delivery.getDate());
				row.createCell(2).setCellValue(delivery.getAddress());
				row.createCell(3).setCellValue(delivery.getEname());
				row.createCell(4).setCellValue(delivery.getStarttime());
				row.createCell(5).setCellValue(delivery.getEndtime());
			}

			// 將 Excel 工作簿寫入到文件
			try (FileOutputStream outputStream = new FileOutputStream(filePath)) {
				workbook.write(outputStream);
				System.out.println("Excel 檔案已成功儲存：" + filePath);
			} catch (IOException e) {
				System.err.println("無法寫入 Excel 檔案：" + filePath);
				e.printStackTrace();
			}

		} catch (IOException e) {
			System.err.println("無法創建目標文件夾：" + folderPath);
			e.printStackTrace();
		}
	}
	//========================= 外送員工管理功能 =============================//
	//查詢狀態!=0
	public List<Delivery> findnotZero(){
		return dRepos.findallnotZero();
	}
	//查詢外送員狀態:待處理
	public List<Delivery> FindPending(){
		return dRepos.findallOne();
	}
	//查詢外送員狀態:已接單
	public List<Delivery> FindAccept(){
		return dRepos.findallTwo();
	}
	//查詢外送員狀態:外送中
	public List<Delivery> FindNowDelivery(){
		return dRepos.findallThree();
	}
	//查詢外送員狀態:已送達
	public List<Delivery> FindDeliveryArrived(){
		return dRepos.findallFour();
	}
	//查詢外送員狀態:取消訂單
	public List<Delivery> FindCancelDelivery(){
		return dRepos.findallZero();
	}
	//修改已接單
	public void UpdAccept(Integer id) {
		dRepos.upddeliverystate(id);
	}		
	//修改復原訂單為待處理
	public void UpdRollBack(Integer id) {
		dRepos.rollback(id);
	}
	//修改訂單
	public void UpdStateZero(Integer id) {
		dRepos.upddeliverystatezero(id);
	}
	//指派外送員 外送員狀態:外送中
	public void UpdEnameDeliveryOrder(String ename,Integer id) {
		dRepos.upddeliveryename(ename,id);
	}
	//外送員狀態:已送達
	public void UpdDeliveryArrived(Integer id) {
		dRepos.upddeliveryEnd(id);
	}
	//一次修改多筆外送員狀態:外送中~已送達 
	public void DeliveryArrivedAll() {
		dRepos.endall();
	}
	//========================= 外送員工管理功能 =============================//
	public int countDeliveriesByEname(String ename) {
		return dRepos.countByEname(ename);
	}

}