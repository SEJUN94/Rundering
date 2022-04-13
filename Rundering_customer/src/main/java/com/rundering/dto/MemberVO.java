package com.rundering.dto;

import java.util.Date;

public class MemberVO {
	
	private String memberNo;
	private String id;
	private String password;
	private String name;
	private String phone;
	private String email;
	private Date registDate;
	private Date modifyDate;
	private int enableWhether;
	private String withDrawal;
    private Date lastLogpsnHourLiver;
    private int loginfailCount;
    
	
	
	
	public MemberVO(String memberNo, String id, String password, String name, String phone, String email,
			Date registDate, Date modifyDate, int enableWhether, String withDrawal, Date lastLogpsnHourLiver,
			int loginfailCount) {
		super();
		this.memberNo = memberNo;
		this.id = id;
		this.password = password;
		this.name = name;
		this.phone = phone;
		this.email = email;
		this.registDate = registDate;
		this.modifyDate = modifyDate;
		this.enableWhether = enableWhether;
		this.withDrawal = withDrawal;
		this.lastLogpsnHourLiver = lastLogpsnHourLiver;
		this.loginfailCount = loginfailCount;
	}
	public String getMemberNo() {
		return memberNo;
	}
	public void setMemberNo(String memberNo) {
		this.memberNo = memberNo;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
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
	public int getEnableWhether() {
		return enableWhether;
	}
	public void setEnableWhether(int enableWhether) {
		this.enableWhether = enableWhether;
	}
	public String getWithDrawal() {
		return withDrawal;
	}
	public void setWithDrawal(String withDrawal) {
		this.withDrawal = withDrawal;
	}
	public Date getLastLogpsnHourLiver() {
		return lastLogpsnHourLiver;
	}
	public void setLastLogpsnHourLiver(Date lastLogpsnHourLiver) {
		this.lastLogpsnHourLiver = lastLogpsnHourLiver;
	}
	public int getLoginfailCount() {
		return loginfailCount;
	}
	public void setLoginfailCount(int loginfailCount) {
		this.loginfailCount = loginfailCount;
	}
}
