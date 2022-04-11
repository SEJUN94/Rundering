package com.rundering.dto;

public class LaundryGoodsStockVO {
	private String branchCode; //지점코드
	private String lndrwaterqlycode; //세탁물품코드
	private int supplyCount;  //용품개수

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
	public int getSupplyCount() {
		return supplyCount;
	}
	public void setSupplyCount(int supplyCount) {
		this.supplyCount = supplyCount;
	}
	
}
