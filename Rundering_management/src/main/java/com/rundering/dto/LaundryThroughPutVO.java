package com.rundering.dto;

import java.util.Date;

public class LaundryThroughPutVO {
	private String throughputNo;   //처리번호
	private int laundryQuota;      //할당세탁량
	private int totalThroughput;   //총세탁처리량
	private int overshoot;         //초과량
	private String areaclcode;     //지역분류코드
	private Date date;             //날짜
	private String branchCode;     //지점코드
	                              
	public String getThroughputNo() {
		return throughputNo;
	}
	public void setThroughputNo(String throughputNo) {
		this.throughputNo = throughputNo;
	}
	public int getLaundryQuota() {
		return laundryQuota;
	}
	public void setLaundryQuota(int laundryQuota) {
		this.laundryQuota = laundryQuota;
	}
	public int getTotalThroughput() {
		return totalThroughput;
	}
	public void setTotalThroughput(int totalThroughput) {
		this.totalThroughput = totalThroughput;
	}
	public int getOvershoot() {
		return overshoot;
	}
	public void setOvershoot(int overshoot) {
		this.overshoot = overshoot;
	}
	public String getAreaclcode() {
		return areaclcode;
	}
	public void setAreaclcode(String areaclcode) {
		this.areaclcode = areaclcode;
	}
	public Date getDate() {
		return date;
	}
	public void setDate(Date date) {
		this.date = date;
	}
	public String getBranchCode() {
		return branchCode;
	}
	public void setBranchCode(String branchCode) {
		this.branchCode = branchCode;
	}
	
	
	
}