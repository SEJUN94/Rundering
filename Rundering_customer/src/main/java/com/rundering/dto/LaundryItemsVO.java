package com.rundering.dto;

import java.util.Date;

public class LaundryItemsVO {
	private String lndrqlymokcode;  //세탁품목코드
	private int price;  //가격
	private String qlymoknm;  //품목명
	private Date registDate;  //등록일
	private Date modifyDate;  //수정일
	private String deleteKey; //삭제키
	private String charger;  //담당자
	
	public String getLndrqlymokcode() {
		return lndrqlymokcode;
	}
	public void setLndrqlymokcode(String lndrqlymokcode) {
		this.lndrqlymokcode = lndrqlymokcode;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public String getQlymoknm() {
		return qlymoknm;
	}
	public void setQlymoknm(String qlymoknm) {
		this.qlymoknm = qlymoknm;
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
	public String getDeleteKey() {
		return deleteKey;
	}
	public void setDeleteKey(String deleteKey) {
		this.deleteKey = deleteKey;
	}
	public String getCharger() {
		return charger;
	}
	public void setCharger(String charger) {
		this.charger = charger;
	}
	
}
