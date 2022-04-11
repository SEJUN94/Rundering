package com.rundering.dto;

import java.util.Date;

public class StartInquiryVO {
	private int fntninqryno; //창업문의번호
	private String applicateName;//문의자명
	private String phone; //연락처
	private String email;//email
	private String hopepaprstatn; //희망지역
	private String stornimnt; //점포구분
	private String add; //주소
	private String ar; //면적
	private String hoperentcnd; //희망임대조건
	private String fntninqrycn;//창업문의내용
	private Date inqrydate;  //문의날짜
	private String charger; //담당자
	private String branchPaprpointcode;  //지점코드

	public int getFntninqryno() {
		return fntninqryno;
	}
	public void setFntninqryno(int fntninqryno) {
		this.fntninqryno = fntninqryno;
	}
	public String getApplicateName() {
		return applicateName;
	}
	public void setApplicateName(String applicateName) {
		this.applicateName = applicateName;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getHopepaprstatn() {
		return hopepaprstatn;
	}
	public void setHopepaprstatn(String hopepaprstatn) {
		this.hopepaprstatn = hopepaprstatn;
	}
	public String getStornimnt() {
		return stornimnt;
	}
	public void setStornimnt(String stornimnt) {
		this.stornimnt = stornimnt;
	}
	public String getAdd() {
		return add;
	}
	public void setAdd(String add) {
		this.add = add;
	}
	public String getAr() {
		return ar;
	}
	public void setAr(String ar) {
		this.ar = ar;
	}
	public String getHoperentcnd() {
		return hoperentcnd;
	}
	public void setHoperentcnd(String hoperentcnd) {
		this.hoperentcnd = hoperentcnd;
	}
	public String getFntninqrycn() {
		return fntninqrycn;
	}
	public void setFntninqrycn(String fntninqrycn) {
		this.fntninqrycn = fntninqrycn;
	}
	public Date getInqrydate() {
		return inqrydate;
	}
	public void setInqrydate(Date inqrydate) {
		this.inqrydate = inqrydate;
	}
	public String getCharger() {
		return charger;
	}
	public void setCharger(String charger) {
		this.charger = charger;
	}
	public String getBranchPaprpointcode() {
		return branchPaprpointcode;
	}
	public void setBranchPaprpointcode(String branchPaprpointcode) {
		this.branchPaprpointcode = branchPaprpointcode;
	}
	
}
