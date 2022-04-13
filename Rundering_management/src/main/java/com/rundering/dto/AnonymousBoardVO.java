package com.rundering.dto;

import java.sql.Date;

public class AnonymousBoardVO {
	private int ano; // 글번호
	private String password; // 패스워드
	private String title; // 제목
	private String content; // 내용
	private Date registDate; // 등록일
	private Date modifyDate; // 수정일
	private String deleteKey; // 삭제키(0유지/1삭제)
	private int viewcnt; // 조회수

	public AnonymousBoardVO() {
	}

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

	public int getViewcnt() {
		return viewcnt;
	}

	public void setViewcnt(int viewcnt) {
		this.viewcnt = viewcnt;
	}

}
