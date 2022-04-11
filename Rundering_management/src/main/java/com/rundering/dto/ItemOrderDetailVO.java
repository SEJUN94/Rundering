package com.rundering.dto;

public class ItemOrderDetailVO {
	private String ordercode; //발주코드
	private int orderCount; //발주개수
	private String lndrwaterqlycode; //세탁물품코드
	public String getOrdercode() {
		return ordercode;
	}
	public void setOrdercode(String ordercode) {
		this.ordercode = ordercode;
	}
	public int getOrderCount() {
		return orderCount;
	}
	public void setOrderCount(int orderCount) {
		this.orderCount = orderCount;
	}
	public String getLndrwaterqlycode() {
		return lndrwaterqlycode;
	}
	public void setLndrwaterqlycode(String lndrwaterqlycode) {
		this.lndrwaterqlycode = lndrwaterqlycode;
	}
}
