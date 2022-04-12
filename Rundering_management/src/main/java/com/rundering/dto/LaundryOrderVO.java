package com.rundering.dto;

import java.util.Date;

public class LaundryOrderVO {
   
	private String orderNo;             //주문번호
	private String requestDetails;      //요청사항
	private Date orderDate;             //주문일시
	private String contactNumber;       //배송연락처
	private Date deliveryRequestDate;   //배송요청일
	private int totalPrice;             //주문총가격
	private Date pickupRequestDate;     //수거요청일
	private Date pickupDate;            //실제수거날짜
	private Date branchArrivalDate;     //지점도착날짜
	private String area;                //지역분류코드
	private Date deliveryDate;          //배송완료일자
	private String odrerStatus;         //주문상태코드
	private String cancelYn;            //취소여부
	private int addressNo;              //주소번호
	private int paymentno;              //결제번호
	private String branchCode;          //지점코드
	private String memberno;            //회원고유번호
	private String deliveryEmployeeId;  //배송담당기사
	private String pickupEmployeeId;    //수거담당기사
	
	public String getOrderNo() {
		return orderNo;
	}
	public void setOrderNo(String orderNo) {
		this.orderNo = orderNo;
	}
	public String getRequestDetails() {
		return requestDetails;
	}
	public void setRequestDetails(String requestDetails) {
		this.requestDetails = requestDetails;
	}
	public Date getOrderDate() {
		return orderDate;
	}
	public void setOrderDate(Date orderDate) {
		this.orderDate = orderDate;
	}
	public String getContactNumber() {
		return contactNumber;
	}
	public void setContactNumber(String contactNumber) {
		this.contactNumber = contactNumber;
	}
	public Date getDeliveryRequestDate() {
		return deliveryRequestDate;
	}
	public void setDeliveryRequestDate(Date deliveryRequestDate) {
		this.deliveryRequestDate = deliveryRequestDate;
	}
	public int getTotalPrice() {
		return totalPrice;
	}
	public void setTotalPrice(int totalPrice) {
		this.totalPrice = totalPrice;
	}
	public Date getPickupRequestDate() {
		return pickupRequestDate;
	}
	public void setPickupRequestDate(Date pickupRequestDate) {
		this.pickupRequestDate = pickupRequestDate;
	}
	public Date getPickupDate() {
		return pickupDate;
	}
	public void setPickupDate(Date pickupDate) {
		this.pickupDate = pickupDate;
	}
	public Date getBranchArrivalDate() {
		return branchArrivalDate;
	}
	public void setBranchArrivalDate(Date branchArrivalDate) {
		this.branchArrivalDate = branchArrivalDate;
	}
	public String getArea() {
		return area;
	}
	public void setArea(String area) {
		this.area = area;
	}
	public Date getDeliveryDate() {
		return deliveryDate;
	}
	public void setDeliveryDate(Date deliveryDate) {
		this.deliveryDate = deliveryDate;
	}
	public String getOdrerStatus() {
		return odrerStatus;
	}
	public void setOdrerStatus(String odrerStatus) {
		this.odrerStatus = odrerStatus;
	}
	public String getCancelYn() {
		return cancelYn;
	}
	public void setCancelYn(String cancelYn) {
		this.cancelYn = cancelYn;
	}
	public int getAddressNo() {
		return addressNo;
	}
	public void setAddressNo(int addressNo) {
		this.addressNo = addressNo;
	}
	public int getPaymentno() {
		return paymentno;
	}
	public void setPaymentno(int paymentno) {
		this.paymentno = paymentno;
	}
	public String getBranchCode() {
		return branchCode;
	}
	public void setBranchCode(String branchCode) {
		this.branchCode = branchCode;
	}
	public String getMemberno() {
		return memberno;
	}
	public void setMemberno(String memberno) {
		this.memberno = memberno;
	}
	public String getDeliveryEmployeeId() {
		return deliveryEmployeeId;
	}
	public void setDeliveryEmployeeId(String deliveryEmployeeId) {
		this.deliveryEmployeeId = deliveryEmployeeId;
	}
	public String getPickupEmployeeId() {
		return pickupEmployeeId;
	}
	public void setPickupEmployeeId(String pickupEmployeeId) {
		this.pickupEmployeeId = pickupEmployeeId;
	}
	
	
	
}
