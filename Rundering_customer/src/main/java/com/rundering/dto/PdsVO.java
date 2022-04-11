package com.rundering.dto;

import java.util.Date;

public class PdsVO {
	private int pdsno;        //글번호
	private String title;        //제목
	private String wrter;        //작성자
	private String content;      //내용
	private int views;        //조회수
	private Date registDate;   //등록일
	private Date modifyDate;   //수정일
	private String deleteat;     //삭제여부
	private String atchFileNo;   //통합첨부파일번호

	public int getPdsno() {
		return pdsno;
	}
	public void setPdsno(int pdsno) {
		this.pdsno = pdsno;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getWrter() {
		return wrter;
	}
	public void setWrter(String wrter) {
		this.wrter = wrter;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public int getViews() {
		return views;
	}
	public void setViews(int views) {
		this.views = views;
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
	public String getDeleteat() {
		return deleteat;
	}
	public void setDeleteat(String deleteat) {
		this.deleteat = deleteat;
	}
	public String getAtchFileNo() {
		return atchFileNo;
	}
	public void setAtchFileNo(String atchFileNo) {
		this.atchFileNo = atchFileNo;
	}
}
