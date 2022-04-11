package com.rundering.dto;

import java.util.Date;

public class FixturesVO {

	private String ctqlycode; //비품코드
	private Date registDate;  //등록일
	private String status;  //상태
	private Date dispositionDate;  //처분일
	private String branchCode;   //지점코드
	private String lndrwaterqlycode; //세탁물품코드

	public String getCtqlycode() {
		return ctqlycode;
	}
	public void setCtqlycode(String ctqlycode) {
		this.ctqlycode = ctqlycode;
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
	public Date getDispositionDate() {
		return dispositionDate;
	}
	public void setDispositionDate(Date dispositionDate) {
		this.dispositionDate = dispositionDate;
	}
	public String getBranchCode() {
		return branchCode;
	}
	public void setBranchCode(String branchCode) {
		this.branchCode = branchCode;
	}
	public String getLndrwaterqlycode() {
		return lndrwaterqlycode;
	}
	public void setLndrwaterqlycode(String lndrwaterqlycode) {
		this.lndrwaterqlycode = lndrwaterqlycode;
	}
}
