package com.team6.member.model;

import java.time.LocalDate;

import org.springframework.stereotype.Component;

import com.fasterxml.jackson.annotation.JsonIgnore;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.OneToOne;
import jakarta.persistence.Table;

@Entity @Table(name = "memberdetail")
@Component
public class MemberDetailBean {

	@Id @GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "mdid")
	private int mdid;
	
	// 外來建:接 MemberAccount 的 maid
	@JsonIgnore
	@OneToOne
	@JoinColumn(name = "fk_maid")
	private MemberAccountBean accountBean;
	
	@Column(name = "mname")
	private String mName;
	@Column(name = "memail")
	private String mEmail;
	@Column(name = "mphone")
	private String mPhone;
	@Column(name = "mbirthday")
	private LocalDate mbirthday;
	@Column(name = "mphoto")
	private String mPhoto;
	@Column(name = "registrationdate")
	private LocalDate registrationdate;

	
	// 方法----------------------------------------------------------------
	public MemberDetailBean() {	}
	public MemberDetailBean(int mdid, MemberAccountBean accountBean, String mName, String mEmail, String mPhone,
			LocalDate mbirthday, String mPhoto, LocalDate registrationDate) {
		this.mdid = mdid;
		this.accountBean = accountBean;
		this.mName = mName;
		this.mEmail = mEmail;
		this.mPhone = mPhone;
		this.mbirthday = mbirthday;
		this.mPhoto = mPhoto;
		registrationdate = registrationDate;
	}
	public String saveToCsv() {
		String csv = mdid +","+ accountBean.getMaid()+","+mName+","+mEmail+","+mPhone+","+mbirthday+","+mPhoto+","+registrationdate;
		return csv;
	}
	
	public String saveToXml() {
//		String xml="<?xml version=\"1.0\" encoding=\"UTF-8\"?>"+"\n"+"<Root>"+"\n";
		String xml="<Row>\n"
				   +"<mdid>"+mdid +"</mdid>\n"
				   +"<fk_maId>"+accountBean.getMaid()+"</fk_maId>\n"
				   +"<mName>"+mName+"</mName>\n"
				   +"<mEmail>"+mEmail+"</mEmail>\n"
				   +"<mPhone>"+mPhone+"</mPhone>\n"
				   +"<mbirthday>"+mbirthday+"</mbirthday>\n"
				   +"<mPhoto>"+mPhoto+"</mPhoto>\n"
				   +"<registrationdate>"+registrationdate+"</registrationdate>\n"
				   +"</Row>\n";
		return xml;
	}
	
	public String saveToJson() {
//		String json="[";
		String json="{\n\"mdid\":\""+mdid+"\",\n"
					+"\"fk_maId\":\""+accountBean.getMaid()+"\",\n"
					+"\"mName\":\""+mName+"\",\n"
					+"\"mEmail\":\""+mEmail+"\",\n"
					+"\"mPhone\":\""+mPhone+"\",\n"
					+"\"mbirthday\":\""+mbirthday+"\",\n"
					+"\"RegistrationDate\":\""+registrationdate+"\"\n},";
//		json=json.substring(1, json.length()-1)+"\n]";
		return json;
	}

	// set and get----------------------------------------------------------------
	public int getMdid() {
		return mdid;
	}

	public void setMdid(int mdid) {
		this.mdid = mdid;
	}

	public MemberAccountBean getAccountBean() {
		return accountBean;
	}

	public void setBean(MemberAccountBean accountBean) {
		this.accountBean = accountBean;
	}

	public String getmName() {
		return mName;
	}

	public void setmName(String mName) {
		this.mName = mName;
	}

	public String getmEmail() {
		return mEmail;
	}

	public void setmEmail(String mEmail) {
		this.mEmail = mEmail;
	}

	public String getmPhone() {
		return mPhone;
	}

	public void setmPhone(String mPhone) {
		this.mPhone = mPhone;
	}

	public LocalDate getMbirthday() {
		return mbirthday;
	}

	public void setMbirthday(LocalDate mbirthday) {
		this.mbirthday = mbirthday;
	}

	public String getmPhoto() {
		return mPhoto;
	}

	public void setmPhoto(String mPhoto) {
		this.mPhoto = mPhoto;
	}

	public LocalDate getRegistrationDate() {
		return registrationdate;
	}

	public void setRegistrationDate(LocalDate registrationDate) {
		registrationdate = registrationDate;
	}

}
