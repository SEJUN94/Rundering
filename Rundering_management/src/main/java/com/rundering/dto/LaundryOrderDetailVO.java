package com.rundering.dto;

public class LaundryOrderDetailVO {
	private int detailOrderno; //상세주문번호
	private String orderno;  //주문번호
	private String paprstatnclcode;  //지역분류코드
	private int price;    //가격
	private String lndrqlymokcode;  //세탁품목코드

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
	public String getPaprstatnclcode() {
		return paprstatnclcode;
	}
	public void setPaprstatnclcode(String paprstatnclcode) {
		this.paprstatnclcode = paprstatnclcode;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public String getLndrqlymokcode() {
		return lndrqlymokcode;
	}
	public void setLndrqlymokcode(String lndrqlymokcode) {
		this.lndrqlymokcode = lndrqlymokcode;
	}
}
