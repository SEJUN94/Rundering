package com.rundering.dto;

import java.util.Date;

import org.springframework.web.multipart.MultipartFile;

public class LaundryArticlesVO {
	private String articlesName;   //물품명
	private String articlesCode;   //세탁물품코드
	private int price;             //물품가격
	private String clcode;         //분류코드
	private Date registDate;       //등록일
	private Date modifyDate;       //수정일
	private String deleteKey;      //삭제키
	private String each;   		   //단위
	private String note;  		   //비고
	private String picture;		   //사진
	private MultipartFile pictureFile; // 사진파일	
	private String uploadPicture; // 변경된 사진 파일명.

	public LaundryArticlesVO() {}
	
	public String getArticlesCode() {
		return articlesCode;
	}
	public void setArticlesCode(String articlesCode) {
		this.articlesCode = articlesCode;
	}
	public String getArticlesName() {
		return articlesName;
	}
	public void setArticlesName(String articlesName) {
		this.articlesName = articlesName;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public String getEach() {
		return each;
	}
	public void setEach(String each) {
		this.each = each;
	}

	public String getClcode() {
		return clcode;
	}
	public void setClcode(String clcode) {
		this.clcode = clcode;
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
	public String getNote() {
		return note;
	}
	public void setNote(String note) {
		this.note = note;
	}

	public String getPicture() {
		return picture;
	}

	public void setPicture(String picture) {
		this.picture = picture;
	}

	public MultipartFile getPictureFile() {
		return pictureFile;
	}

	public void setPictureFile(MultipartFile pictureFile) {
		this.pictureFile = pictureFile;
	}

	public String getUploadPicture() {
		return uploadPicture;
	}

	public void setUploadPicture(String uploadPicture) {
		this.uploadPicture = uploadPicture;
	}
	
}
