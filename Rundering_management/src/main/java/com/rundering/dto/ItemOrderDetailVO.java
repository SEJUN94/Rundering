package com.rundering.dto;

public class ItemOrderDetailVO {
	private String detailOrdercode; //상세발주코드
	private int orderCount;         //발주개수
	private String articlesCode;    //세탁물품코드
	private String ordercode;       //발주코드
	
	public String getDetailOrdercode() {
		return detailOrdercode;
	}
	public void setDetailOrdercode(String detailOrdercode) {
		this.detailOrdercode = detailOrdercode;
	}
	public int getOrderCount() {
		return orderCount;
	}
	public void setOrderCount(int orderCount) {
		this.orderCount = orderCount;
	}
	public String getArticlesCode() {
		return articlesCode;
	}
	public void setArticlesCode(String articlesCode) {
		this.articlesCode = articlesCode;
	}
	public String getOrdercode() {
		return ordercode;
	}
	public void setOrdercode(String ordercode) {
		this.ordercode = ordercode;
	}

	
	
}
