package com.rundering.service;

import java.util.List;
import java.util.Map;

import com.rundering.dto.LaundryItemsVO;

public interface LaundryItemsService {
	
	//세탁품목 등록
	void regist(LaundryItemsVO laundryItems) throws Exception;
	// 세탁품목 의류 목록조회 - 주문화면에서 출력할 것
	List<LaundryItemsVO> getClothingList() throws Exception;
	// 세탁품목 침구 목록조회 - 주문화면에서 출력할 것
	List<LaundryItemsVO> getBeddingList() throws Exception;
	// 세탁품목 신발 목록조회 - 주문화면에서 출력할 것
	List<LaundryItemsVO> getShoesList() throws Exception;
	// 세탁품목 전체 목록조회 - 이용안내
	Map<String, Object> getlaundryItemsList() throws Exception;
	
}
