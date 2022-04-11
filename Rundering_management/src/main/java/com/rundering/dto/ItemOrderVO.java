package com.rundering.dto;

public class ItemOrderVO {
	private String ordercode; //발주코드
	private int itemOrderPaymentPrice; //결제가격
	private String itemOrderStatus; //상태
	private String charger;  //담당자
	private String branchCode;  //지점코드

	public String getOrdercode() {
		return ordercode;
	}
	public void setOrdercode(String ordercode) {
		this.ordercode = ordercode;
	}
	public int getItemOrderPaymentPrice() {
		return itemOrderPaymentPrice;
	}
	public void setItemOrderPaymentPrice(int itemOrderPaymentPrice) {
		this.itemOrderPaymentPrice = itemOrderPaymentPrice;
	}
	public String getItemOrderStatus() {
		return itemOrderStatus;
	}
	public void setItemOrderStatus(String itemOrderStatus) {
		this.itemOrderStatus = itemOrderStatus;
	}
	public String getCharger() {
		return charger;
	}
	public void setCharger(String charger) {
		this.charger = charger;
	}
	public String getBranchCode() {
		return branchCode;
	}
	public void setBranchCode(String branchCode) {
		this.branchCode = branchCode;
	}
}
