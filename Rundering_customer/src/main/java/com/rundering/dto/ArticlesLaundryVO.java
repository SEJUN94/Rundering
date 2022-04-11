package com.rundering.dto;

import java.sql.Date;

public class ArticlesLaundryVO {
	private String lndrwaterqlyCode;   //세탁물품코드
	private String productName;       //상품명
	private String price;              //상품가격
	private String clCode;             //분류코드
	private Date registDate;          //등록일
	private Date modifyDate;          //수정일
	private String deleteKey;       //삭제키
	public String getLndrwaterqlyCode() {
		return lndrwaterqlyCode;
	}
	public void setLndrwaterqlyCode(String lndrwaterqlyCode) {
		this.lndrwaterqlyCode = lndrwaterqlyCode;
	}
	public String getProductName() {
		return productName;
	}
	public void setProductName(String productName) {
		this.productName = productName;
	}
	public String getPrice() {
		return price;
	}
	public void setPrice(String price) {
		this.price = price;
	}
	public String getClCode() {
		return clCode;
	}
	public void setClCode(String clCode) {
		this.clCode = clCode;
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
	
	
	
}
