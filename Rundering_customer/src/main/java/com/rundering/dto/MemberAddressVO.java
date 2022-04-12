package com.rundering.dto;

import java.util.Date;

public class MemberAddressVO {
	private int weeksmallno; //주소번호
	private String add1;  //주소
	private String add2;  //상세주소
	private String zip; //우편번호
	private Date registDate;  //등록일
	private Date modifyDate;  //수정일
	private String addWhater; //주소지여부
	private String memberno; //회원고유번호

	public int getWeeksmallno() {
		return weeksmallno;
	}
	public void setWeeksmallno(int weeksmallno) {
		this.weeksmallno = weeksmallno;
	}
	public String getAdd1() {
		return add1;
	}
	public void setAdd1(String add1) {
		this.add1 = add1;
	}
	public String getAdd2() {
		return add2;
	}
	public void setAdd2(String add2) {
		this.add2 = add2;
	}
	public String getZip() {
		return zip;
	}
	public void setZip(String zip) {
		this.zip = zip;
	}
	public Date getRegistDate() {
		return registDate;
	}
	public void setRegistDate(Date registDate) {
		this.registDate = registDate;
	}
	public Date getModifyDate() {
		return modifyDate;
	}
	public void setModifyDate(Date modifyDate) {
		this.modifyDate = modifyDate;
	}
	public String getAddWhater() {
		return addWhater;
	}
	public void setAddWhater(String addWhater) {
		this.addWhater = addWhater;
	}
	public String getMemberno() {
		return memberno;
	}
	public void setMemberno(String memberno) {
		this.memberno = memberno;
	}
}
