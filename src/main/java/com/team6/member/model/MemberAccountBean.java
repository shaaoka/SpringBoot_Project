package com.team6.member.model;

import org.springframework.stereotype.Component;

import jakarta.persistence.CascadeType;
import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.OneToOne;
import jakarta.persistence.Table;

@Entity @Table(name = "memberaccount")
@Component
public class MemberAccountBean {

	@Id @GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "maid")
	private int maid;
	@Column(name = "maccount")
	private String mAccount; 
	@Column(name = "mpassword")
	private String mPassword; 
	@Column(name = "permissions")
	private int permissions;
	@Column(name = "hidden")
	private int hidden;
	@Column(name = "google")
	private String google; 
	
	@OneToOne(mappedBy = "accountBean",cascade = CascadeType.ALL)
	private MemberDetailBean detailBean;
	
	// 方法----------------------------------------------------------------
	public MemberAccountBean() {}
	public MemberAccountBean(int maid, String mAccount, String mPassword, int permissions, int hidden,
			MemberDetailBean detailBean) {
		this.maid = maid;
		this.mAccount = mAccount;
		this.mPassword = mPassword;
		this.permissions = permissions;
		this.hidden = hidden;
		this.detailBean = detailBean;
	}

	public MemberAccountBean(int maid, String mAccount, String mPassword, int permissions, int hidden, String google,
			MemberDetailBean detailBean) {
		this.maid = maid;
		this.mAccount = mAccount;
		this.mPassword = mPassword;
		this.permissions = permissions;
		this.hidden = hidden;
		this.google = google;
		this.detailBean = detailBean;
	}
	
	public String saveToCsv() {
		String csv = maid +","+ mAccount+","+mPassword+","+permissions+","+hidden+","+google;
		return csv;
	}
	public String saveToXml() {
//		String xml="<?xml version=\"1.0\" encoding=\"UTF-8\"?>"+"\n"+"<Root>"+"\n";
		String xml="<Row>\n"
				   +"<maid>"+maid+"</maid>\n"
				   +"<mAccount>"+mAccount+"</mAccount>\n"
				   +"<mPassword>"+mPassword+"</mPassword>\n"
				   +"<permissions>"+permissions+"</permissions>\n"
				   +"<hidden>"+hidden+"</hidden>\n"
				   +"<google>"+google+"</google>\n"
				   +"</Row>\n";
		return xml;
	}
	public String saveToJson() {
//		String json="[";
		String json="{\n\"maid\":\""+maid+"\",\n"
					+"\"mAccount\":\""+mAccount+"\",\n"
					+"\"mPassword\":\""+mPassword+"\",\n"
					+"\"permissions\":\""+permissions+"\",\n"
					+"\"hidden\":\""+hidden+"\","
					+"\"google\":\""+google+"\"\n},";
//		json=json.substring(1, json.length()-1)+"\n]";
		return json;
	}

	// set and get----------------------------------------------------------------
	public int getMaid() {
		return maid;
	}
	public void setMaid(int maid) {
		this.maid = maid;
	}
	public String getmAccount() {
		return mAccount;
	}
	public void setmAccount(String mAccount) {
		this.mAccount = mAccount;
	}
	public String getmPassword() {
		return mPassword;
	}
	public void setmPassword(String mPassword) {
		this.mPassword = mPassword;
	}
	public MemberDetailBean getDetailBean() {
		return detailBean;
	}
	public void setDetailBean(MemberDetailBean detailBean) {
		this.detailBean = detailBean;
	}
	public int getPermissions() {
		return permissions;
	}
	public void setPermissions(int permissions) {
		this.permissions = permissions;
	}
	public int getHidden() {
		return hidden;
	}
	public void setHidden(int hidden) {
		this.hidden = hidden;
	}
	public String getGoogle() {
		return google;
	}
	public void setGoogle(String google) {
		this.google = google;
	}
	
}
