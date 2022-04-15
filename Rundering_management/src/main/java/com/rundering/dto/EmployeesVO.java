package com.rundering.dto;

import java.util.Date;

public class EmployeesVO {
	private String employeeId; //사원번호
	private String branchCode; //지점코드
	private Date joiningCompanyDate; //입사일
	private String department; //부서
	private String rspofc; //직책
	private String position; //직위
	private Date registDate; //등록일
	private Date modifyDate; //수정일
	private String deleteKey; //삭제키
	private String memberno; //회원고유번호
	
	
	public EmployeesVO() {
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
	public Date getJoiningCompanyDate() {
		return joiningCompanyDate;
	}
	public void setJoiningCompanyDate(Date joiningCompanyDate) {
		this.joiningCompanyDate = joiningCompanyDate;
	}
	public String getDepartment() {
		return department;
	}
	public void setDepartment(String department) {
		this.department = department;
	}
	public String getRspofc() {
		return rspofc;
	}
	public void setRspofc(String rspofc) {
		this.rspofc = rspofc;
	}
	public String getPosition() {
		return position;
	}
	public void setPosition(String position) {
		this.position = position;
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
	public String getMemberno() {
		return memberno;
	}
	public void setMemberno(String memberno) {
		this.memberno = memberno;
	}
}
