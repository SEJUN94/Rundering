package com.rundering.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.rundering.dao.LaundryItemsDAO;
import com.rundering.dto.LaundryItemsVO;

public class LaundryItemsServiceImpl implements LaundryItemsService{
	
	private LaundryItemsDAO laundryItemsDAO;
	public void setLaundryItemsDAO(LaundryItemsDAO laundryItemsDAO) {
		this.laundryItemsDAO = laundryItemsDAO;
	}

	@Override
	public void regist(LaundryItemsVO laundryItems) throws Exception{
		
		// 세탁품목번호PK가 카테고리+시퀀스라서 카테고리별 시퀀스 처리
		switch (laundryItems.getLaundeyCategory()) {
		case "CL":
			String ClothingSequence = laundryItemsDAO.SelectClothingSequenceNextValue();
			laundryItems.setLaundryItemsCode(ClothingSequence);
			break;
		case "BE":
			String beddingSequence = laundryItemsDAO.SelectBeddingSequenceNextValue();
			laundryItems.setLaundryItemsCode(beddingSequence);
			break;
		case "SH":
			String shoesSequence = laundryItemsDAO.SelectShoesSequenceNextValue();
			laundryItems.setLaundryItemsCode(shoesSequence);
			break;
		}
		laundryItemsDAO.insertLaundryItems(laundryItems);
	}

	@Override
	public List<LaundryItemsVO> getClothingList() throws Exception {
		return laundryItemsDAO.selectClothingList();
	}
	@Override
	public List<LaundryItemsVO> getBeddingList() throws Exception {
		return laundryItemsDAO.selectBeddingList();
	}
	@Override
	public List<LaundryItemsVO> getShoesList() throws Exception {
		return laundryItemsDAO.selectShoesList();
	}
	
	
	@Override
	public Map<String, Object> getlaundryItemsList() throws Exception {
		Map<String, Object> dataMap = new HashMap<String, Object>();
		
		List<LaundryItemsVO> laundryItemsList = laundryItemsDAO.getlaundryItemsList();
		
		dataMap.put("laundryItemsList", laundryItemsList);
		
		
		return dataMap;
	}

}
