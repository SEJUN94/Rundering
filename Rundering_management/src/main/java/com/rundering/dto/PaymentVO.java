package com.rundering.dto;

import java.util.Date;

public class PaymentVO {
	private int paymentno;      //결제번호
	private Date paymentDate;   //결제일자
	private String paymentType; //결제종류
	private String cancelWhater;//취소여부
	private String refundWhater;//환불여부
	private String orderno;     //주문번호
	
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
}
