package com.team6.reservation.model;

import java.util.Date;
import java.util.UUID;

import org.hibernate.annotations.GenericGenerator;
import org.springframework.stereotype.Component;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Table;

@Entity
@Table(name = "reservation")
@Component
public class Reserve {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "RESERVATIONID")
	private int  reservationId;
	@Column(name = "RESERVATIONUUID", columnDefinition = "BINARY(16)")
	private UUID reservationUuid;
	@Column(name = "ACCOUNT")
	private String account;
	@Column(name = "RESERVATIONNAME")
	private String reservationName;
	@Column(name = "PHONE")
	private String phone;
	@Column(name = "NUMBEROFPEOPLE")
	private int numberOfPeople;
	@Column(name = "RESERVATIONTIME")
	private String reservationTime;
	@Column(name = "RESERVATIONDATE")
	private String reservationDate;
	@Column(name = "RESERVATIONSTATUS")
	private int reservationStatus;
	@Column(name = "NOTE")
	private String note;
	@Column(name = "CHECKINSTATUS")
	private int checkInStatus;
	@Column(name= "MAIL")
	private String mail;
	
	//匯出CSV(null印出空字串)
	public String saveToCsv() {
		String csv = nullToEmpty(reservationUuid) +","+ account+","+reservationName+","+phone+","+nullToEmpty(mail)+","+numberOfPeople+","+reservationDate+","+reservationTime+","+reservationStatus+","+note;
		return csv;
	}
	
	private String nullToEmpty(Object value) {
		if(value == null) {
			return "";
		}else {
			return value.toString();
		}
	}
	
	//匯出csv(null印出null)
//	public String saveToCsv() {
//		String csv = reservationUuid +","+ account+","+reservationName+","+phone+","+mail+","+numberOfPeople+","+reservationDate+","+reservationTime+","+reservationStatus+","+note;
//		return csv;
//	}
		
	public Reserve(String account, String reservationName, String phone, int numberOfPeople, String reservationTime,
			String reservationDate, int reservationStatus, String note, int checkInStatus) {
		this.account = account;
		this.reservationName = reservationName;
		this.phone = phone;
		this.numberOfPeople = numberOfPeople;
		this.reservationTime = reservationTime;
		this.reservationDate = reservationDate;
		this.reservationStatus = reservationStatus;
		this.note = note;
		this.checkInStatus = checkInStatus;
	}


	public Reserve(int reservationId,UUID reservationUuid ,String account, String reservationName, String phone, int numberOfPeople,
			String reservationTime, String reservationDate, int reservationStatus, String note, int checkInStatus) {
		this.reservationId = reservationId;
		this.reservationUuid = reservationUuid;
		this.account = account;
		this.reservationName = reservationName;
		this.phone = phone;
		this.numberOfPeople = numberOfPeople;
		this.reservationTime = reservationTime;
		this.reservationDate = reservationDate;
		this.reservationStatus = reservationStatus;
		this.note = note;
		this.checkInStatus = checkInStatus;
	}


	public int getReservationId() {
		return reservationId;
	}


	public void setReservationId(int reservationId) {
		this.reservationId = reservationId;
	}
	
	
	public UUID getReservationUUID() {
		return reservationUuid;
	}

	public void setReservationUUID(UUID reservationUuid) {
		this.reservationUuid = reservationUuid;
	}

	public String getAccount() {
		return account;
	}


	public void setAccount(String account) {
		this.account = account;
	}


	public String getReservationName() {
		return reservationName;
	}


	public void setReservationName(String reservationName) {
		this.reservationName = reservationName;
	}


	public String getPhone() {
		return phone;
	}


	public void setPhone(String phone) {
		this.phone = phone;
	}


	public int getNumberOfPeople() {
		return numberOfPeople;
	}


	public void setNumberOfPeople(int numberOfPeople) {
		this.numberOfPeople = numberOfPeople;
	}


	public String getReservationTime() {
		return reservationTime;
	}


	public void setReservationTime(String reservationTime) {
		this.reservationTime = reservationTime;
	}


	public String getReservationDate() {
		return reservationDate;
	}


	public void setReservationDate(String reservationDate) {
		this.reservationDate = reservationDate;
	}


	public int getReservationStatus() {
		return reservationStatus;
	}


	public void setReservationStatus(int reservationStatus) {
		this.reservationStatus = reservationStatus;
	}


	public String getNote() {
		return note;
	}


	public void setNote(String note) {
		this.note = note;
	}


	public int getCheckInStatus() {
		return checkInStatus;
	}


	public void setCheckInStatus(int checkInStatus) {
		this.checkInStatus = checkInStatus;
	}

	public String getMail() {
		return mail;
	}

	public void setMail(String mail) {
		this.mail = mail;
	}

	public Reserve() {
	}

}




