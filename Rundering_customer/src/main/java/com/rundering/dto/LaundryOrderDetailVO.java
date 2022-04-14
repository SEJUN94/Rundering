package com.rundering.dto;

public class LaundryOrderDetailVO {
	private int detailOrderno; //상세주문번호
	private String orderno;  //주문번호
	private int price;    //가격
	private String laundryItemsCode;  //세탁품목코드
	private int quantity; //개수
	
	public int getDetailOrderno() {
		return detailOrderno;
	}
	public void setDetailOrderno(int detailOrderno) {
		this.detailOrderno = detailOrderno;
	}
	public String getOrderno() {
		return orderno;
	}
	public void setOrderno(String orderno) {
		this.orderno = orderno;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public String getLaundryItemsCode() {
		return laundryItemsCode;
	}
	public void setLaundryItemsCode(String laundryItemsCode) {
		this.laundryItemsCode = laundryItemsCode;
	}
	public int getQuantity() {
		return quantity;
	}
	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}
	

	
}
