package com.rundering.dto;

import java.util.Date;

public class AnonymousVO {

	private int ano; // 글번호
	private String password; // 패스워드
	private String title; // 제목
	private String content; // 내용
	private Date regist_date; // 등록일
	private Date modify_date; // 수정일
	private String delete_key; //삭제키

	public int getAno() {
		return ano;
	}

	public void setAno(int ano) {
		this.ano = ano;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public Date getRegist_date() {
		return regist_date;
	}

	public void setRegist_date(Date regist_date) {
		this.regist_date = regist_date;
	}

	public Date getModify_date() {
		return modify_date;
	}

	public void setModify_date(Date modify_date) {
		this.modify_date = modify_date;
	}

	public String getDelete_key() {
		return delete_key;
	}

	public void setDelete_key(String delete_key) {
		this.delete_key = delete_key;
	}
	
	

}
