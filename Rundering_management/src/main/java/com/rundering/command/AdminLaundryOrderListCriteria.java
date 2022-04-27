package com.rundering.command;

public class AdminLaundryOrderListCriteria extends Criteria{
	
	private String orderStatus;
	private String pickupRequestDate;
	private String branchCode;
	private String area;
	
	private String startDate;
	private String endDate;
	
	public String getOrderStatus() {
		return orderStatus;
	}
	public void setOrderStatus(String orderStatus) {
		this.orderStatus = orderStatus;
	}
	public String getPickupRequestDate() {
		return pickupRequestDate;
	}
	public void setPickupRequestDate(String pickupRequestDate) {
		this.pickupRequestDate = pickupRequestDate;
	}
	
	private void setDate() {
		if(this.pickupRequestDate != null && !this.pickupRequestDate.isEmpty()) {
			String[] split = this.pickupRequestDate.split("~");
			if(split[0].equals(split[1])) {
				this.startDate = split[0];
				this.endDate = split[0];
			}else {
				this.startDate = split[0];
				this.endDate = split[1];
			}
		}
	}
	
	public String getStartDate() {
		setDate();
		return startDate;
	}
	public String getEndDate() {
		return endDate;
	}
	public String getBranchCode() {
		return branchCode;
	}
	public void setBranchCode(String branchCode) {
		this.branchCode = branchCode;
	}
	public String getArea() {
		return area;
	}
	public void setArea(String area) {
		this.area = area;
	}
	
	
	
	
}






