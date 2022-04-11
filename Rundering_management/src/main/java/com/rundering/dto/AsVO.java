package com.rundering.dto;

import java.sql.Date;

public class AsVO {
	private int asno;             //AS번호
	private String ctqlyCode;        //비품코드
	private String title;            //제목
	private String ascontent;        //내용?
	private String causeFailure;    //고장원인?
	private Date registDate;      //등록일
	private String status;           //상태
	private Date modifyDate;      //수정일
	private String deleteat;         //삭제여부
	private String employeeId;      //담당자
	private String branchCode;      //지점코드
	
	public int getAsno() {
		return asno;
	}
	public void setAsno(int asno) {
		this.asno = asno;
	}
	public String getCtqlyCode() {
		return ctqlyCode;
	}
	public void setCtqlyCode(String ctqlyCode) {
		this.ctqlyCode = ctqlyCode;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getAscontent() {
		return ascontent;
	}
	public void setAscontent(String ascontent) {
		this.ascontent = ascontent;
	}
	public String getCauseFailure() {
		return causeFailure;
	}
	public void setCauseFailure(String causeFailure) {
		this.causeFailure = causeFailure;
	}
	public Date getRegistDate() {
		return registDate;
	}
	public void setRegistDate(Date registDate) {
		this.registDate = registDate;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
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
	public String getEmployeeId() {
		return employeeId;
	}
	public void setEmployeeId(String employeeId) {
		this.employeeId = employeeId;
	}
	public String getBranchCode() {
		return branchCode;
	}
	public void setBranchCode(String branchCode) {
		this.branchCode = branchCode;
	}

	
}
