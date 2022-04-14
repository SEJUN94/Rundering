package com.rundering.command;

import com.rundering.dto.LaundryItemsVO;

public class LaundryItemsRegistCommand {
	
	private String price;  //가격
	private String itemsName;  //품목명
	private String charger;  //담당자
	private String laundeyCategory; //세탁품목구분
	
	
	public String getPrice() {
		return price;
	}
	public void setPrice(String price) {
		this.price = price;
	}
	public String getItemsName() {
		return itemsName;
	}
	public void setItemsName(String itemsName) {
		this.itemsName = itemsName;
	}
	public String getCharger() {
		return charger;
	}
	public void setCharger(String charger) {
		this.charger = charger;
	}
	public String getLaundeyCategory() {
		return laundeyCategory;
	}
	public void setLaundeyCategory(String laundeyCategory) {
		this.laundeyCategory = laundeyCategory;
	}
	
	public LaundryItemsVO toLaundryItemsVO() {
		LaundryItemsVO laundryItems = new LaundryItemsVO();
		laundryItems.setPrice(Integer.parseInt(this.price));
		laundryItems.setItemsName(this.itemsName);
		//laundryItems.setCharger(this.charger);
		laundryItems.setLaundeyCategory(this.laundeyCategory);
		
		return laundryItems; 
	}
	
}
