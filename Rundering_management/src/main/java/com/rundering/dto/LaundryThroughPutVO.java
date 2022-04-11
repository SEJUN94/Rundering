package com.rundering.dto;

import java.util.Date;

public class LaundryThroughPutVO {
	private String processno;  //처리번호
	private int asgnlndrqy; //할당세탁량
	private int totlndrofficliqy; //총세탁처리량
	private int excessqy;  //초과량
	private String areaclcode; //지역분류코드
	private Date date;  //날찌
	private String branchCode; //지점코드

	public String getProcessno() {
		return processno;
	}
	public void setProcessno(String processno) {
		this.processno = processno;
	}
	public int getAsgnlndrqy() {
		return asgnlndrqy;
	}
	public void setAsgnlndrqy(int asgnlndrqy) {
		this.asgnlndrqy = asgnlndrqy;
	}
	public int getTotlndrofficliqy() {
		return totlndrofficliqy;
	}
	public void setTotlndrofficliqy(int totlndrofficliqy) {
		this.totlndrofficliqy = totlndrofficliqy;
	}
	public int getExcessqy() {
		return excessqy;
	}
	public void setExcessqy(int excessqy) {
		this.excessqy = excessqy;
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
