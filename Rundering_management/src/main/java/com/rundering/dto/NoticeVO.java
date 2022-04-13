package com.rundering.dto;

import java.util.Date;

public class NoticeVO {
	private int noticeno;    //글번호
	private String title;       //제목
	private String content;     //내용
	private String employeeId;  //작성자
	private String views;       //조회수
	private Date registDate;  //등록일
	private Date modifyDate;  //수정일
	private String deleteat;    //삭제여부
	private String branchCode;  //지점코드

	public NoticeVO(int noticeno, String title, String content, String employeeId, String views, Date registDate,
			Date modifyDate, String deleteat, String branchCode) {
		super();
		this.noticeno = noticeno;
		this.title = title;
		this.content = content;
		this.employeeId = employeeId;
		this.views = views;
		this.registDate = registDate;
		this.modifyDate = modifyDate;
		this.deleteat = deleteat;
		this.branchCode = branchCode;
	}
	
	public int getNoticeno() {
		return noticeno;
	}
	public void setNoticeno(int noticeno) {
		this.noticeno = noticeno;
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
	public String getEmployeeId() {
		return employeeId;
	}
	public void setEmployeeId(String employeeId) {
		this.employeeId = employeeId;
	}
	public String getViews() {
		return views;
	}
	public void setViews(String views) {
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
	public String getBranchCode() {
		return branchCode;
	}
	public void setBranchCode(String branchCode) {
		this.branchCode = branchCode;
	}
}
