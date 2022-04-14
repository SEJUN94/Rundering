package com.rundering.dao;

import com.rundering.dto.LaundryItemsVO;

public interface LaundryItemsDAO {
	
	//의류 시퀀스
	public String SelectClothingSequenceNextValue();
	//침구 시퀀스
	public String SelectBeddingSequenceNextValue();
	//신발 시퀀스
	public String SelectShoesSequenceNextValue();
	
	//세탁품목 등록
	public void insertLaundryItems(LaundryItemsVO laundryItems);
	
	
}
