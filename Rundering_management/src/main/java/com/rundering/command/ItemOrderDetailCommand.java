package com.rundering.command;

import java.util.Date;

import com.rundering.dto.ItemOrderDetailVO;
import com.rundering.dto.ItemOrderVO;

public class ItemOrderDetailCommand {
	private String ordercode; 		   	//발주코드
	private String itemOrderPaymentPrice; 	//결제가격
	private String itemOrderStatus;    	//상태
	private String charger;
	private String branchCode; 			//지점코드
	private Date registDate;			//등록일 
	private Date receiptDate; 			//수령일
	private String articlesCode;    //세탁물품코드
	private String seq; 				//순번
	private String orderCount;         //발주개수
	public String getOrdercode() {
		return ordercode;
	}
	public void setOrdercode(String ordercode) {
		this.ordercode = ordercode;
	}
	public String getItemOrderPaymentPrice() {
		return itemOrderPaymentPrice;
	}
	public void setItemOrderPaymentPrice(String itemOrderPaymentPrice) {
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
	public Date getRegistDate() {
		return registDate;
	}
	public void setRegistDate(Date registDate) {
		this.registDate = registDate;
	}
	public Date getReceiptDate() {
		return receiptDate;
	}
	public void setReceiptDate(Date receiptDate) {
		this.receiptDate = receiptDate;
	}
	public String getArticlesCode() {
		return articlesCode;
	}
	public void setArticlesCode(String articlesCode) {
		this.articlesCode = articlesCode;
	}
	public String getSeq() {
		return seq;
	}
	public void setSeq(String seq) {
		this.seq = seq;
	}
	public String getOrderCount() {
		return orderCount;
	}
	public void setOrderCount(String orderCount) {
		this.orderCount = orderCount;
	}
	
	public ItemOrderVO toItemOrder() {
		ItemOrderVO itemOrder = new ItemOrderVO();
		itemOrder.setOrdercode(ordercode);
		itemOrder.setItemOrderPaymentPrice(Integer.parseInt(itemOrderPaymentPrice));
		itemOrder.setItemOrderStatus(itemOrderStatus);
		itemOrder.setCharger(charger);
		itemOrder.setBranchCode(branchCode);
		itemOrder.setRegistDate(registDate);
		itemOrder.setReceiptDate(receiptDate);
		return itemOrder;
	}
	
	public ItemOrderDetailVO toItemOrderDetail() {
		ItemOrderDetailVO itemOrderDetail = new ItemOrderDetailVO();
		itemOrderDetail.setOrdercode(ordercode);
		itemOrderDetail.setArticlesCode(articlesCode);
		itemOrderDetail.setSeq(Integer.parseInt(seq));
		itemOrderDetail.setOrderCount(Integer.parseInt(orderCount));
		
		return itemOrderDetail;
	}
}	
