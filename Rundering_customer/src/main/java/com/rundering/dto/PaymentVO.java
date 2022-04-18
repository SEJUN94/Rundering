package com.rundering.dto;

import java.util.Date;

public class PaymentVO {
	private int paymentno;      	//결제번호
	private Date paymentDate;   	//결제일자
	private String paymentType; 	//결제종류
	private String cancelWhater;	//취소여부
	private String refundWhater;	//환불여부
	private String orderno;     	//주문번호
	private String memberno;		//고객고유번호
	private String PAYMENT_NAME;	//결제상품명
	private String PAYMENT_PRICE;	//결제상품명
	
	
	public PaymentVO() {
		super();
	}


	public int getPaymentno() {
		return paymentno;
	}
	public void setPaymentno(int paymentno) {
		this.paymentno = paymentno;
	}
	public Date getPaymentDate() {
		return paymentDate;
	}
	public void setPaymentDate(Date paymentDate) {
		this.paymentDate = paymentDate;
	}
	public String getPaymentType() {
		return paymentType;
	}
	public void setPaymentType(String paymentType) {
		this.paymentType = paymentType;
	}
	public String getCancelWhater() {
		return cancelWhater;
	}
	public void setCancelWhater(String cancelWhater) {
		this.cancelWhater = cancelWhater;
	}
	public String getRefundWhater() {
		return refundWhater;
	}
	public void setRefundWhater(String refundWhater) {
		this.refundWhater = refundWhater;
	}
	public String getOrderno() {
		return orderno;
	}
	public void setOrderno(String orderno) {
		this.orderno = orderno;
	}
	public String getMemberno() {
		return memberno;
	}
	public void setMemberno(String memberno) {
		this.memberno = memberno;
	}
	public String getPAYMENT_NAME() {
		return PAYMENT_NAME;
	}
	public void setPAYMENT_NAME(String pAYMENT_NAME) {
		PAYMENT_NAME = pAYMENT_NAME;
	}
	public String getPAYMENT_PRICE() {
		return PAYMENT_PRICE;
	}
	public void setPAYMENT_PRICE(String pAYMENT_PRICE) {
		PAYMENT_PRICE = pAYMENT_PRICE;
	}
	
}
