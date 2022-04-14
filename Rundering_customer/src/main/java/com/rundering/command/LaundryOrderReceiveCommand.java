package com.rundering.command;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import com.rundering.dto.LaundryOrderDetailVO;
import com.rundering.dto.LaundryOrderVO;

public class LaundryOrderReceiveCommand {
	
	//세탁주문테이블 컬럼
	private String contactNumber;       //배송연락처
	private String pickupRequestDate;   //수거요청일
	private String addressNo;           //주소번호
	private String requestDetails;      //요청사항
	
	//세탁주문상세테이블 컬럼
	private String[] laundryItemsCode;  //세탁품목코드
	
	
	public String getContactNumber() {
		return contactNumber;
	}
	public void setContactNumber(String contactNumber) {
		this.contactNumber = contactNumber;
	}
	public String getPickupRequestDate() {
		return pickupRequestDate;
	}
	public void setPickupRequestDate(String pickupRequestDate) {
		this.pickupRequestDate = pickupRequestDate;
	}
	public String getAddressNo() {
		return addressNo;
	}
	public void setAddressNo(String addressNo) {
		this.addressNo = addressNo;
	}
	public String getRequestDetails() {
		return requestDetails;
	}
	public void setRequestDetails(String requestDetails) {
		this.requestDetails = requestDetails;
	}
	public String[] getLaundryItemsCode() {
		return laundryItemsCode;
	}
	public void setLaundryItemsCode(String[] laundryItemsCode) {
		this.laundryItemsCode = laundryItemsCode;
	}
	
	
	public LaundryOrderVO toLaundryOrderVO() throws ParseException {
		LaundryOrderVO laundryOrder = new LaundryOrderVO();
		laundryOrder.setContactNumber(this.contactNumber);

		SimpleDateFormat fm = new SimpleDateFormat("yyyyy-MM-dd");
		Date toDate = fm.parse(this.pickupRequestDate);
		laundryOrder.setPickupRequestDate(toDate);
		
		//laundryOrder.setAddressNo(Integer.parseInt(addressNo));
		laundryOrder.setRequestDetails(this.requestDetails);
		
		return laundryOrder;
	}
	
	public LaundryOrderDetailVO toLaundryOrderDetailVO() throws Exception{
		LaundryOrderDetailVO laundryOrderDetail = new LaundryOrderDetailVO();
		
		if (this.laundryItemsCode != null && this.laundryItemsCode.length > 0) {
			for (String string : this.laundryItemsCode) {
				
			}
		}
		
		return laundryOrderDetail;
	}
	
}
