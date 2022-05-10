package com.rundering.dto;

public class OrderDelayDTO {
	private String brnachCode;
	private int startNumber;
	private int endNumber;
	
	public OrderDelayDTO() {
	}
	public String getBrnachCode() {
		return brnachCode;
	}
	public void setBrnachCode(String brnachCode) {
		this.brnachCode = brnachCode;
	}
	public int getStartNumber() {
		return startNumber;
	}
	public void setStartNumber(int startNumber) {
		this.startNumber = startNumber;
	}
	public int getEndNumber() {
		return endNumber;
	}
	public void setEndNumber(int endNumber) {
		this.endNumber = endNumber;
	}
	
	

}
