package com.rundering.service;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import com.rundering.dto.LaundryOrderDetailVO;
import com.rundering.dto.LaundryOrderVO;

public interface LaundryOrderService {
	
	// 세탁주문접수
	String orderReceive(LaundryOrderVO laundryOrder, List<LaundryOrderDetailVO> laundryOrderDetailVOList) throws Exception;
	
	// 결제정보 금액확인
	Map<String, Object> checkOrder(List<LaundryOrderDetailVO> laundryOrderDetailVOList) throws SQLException;
	
	// 세탁주문조회
	LaundryOrderVO getLaundryOrder(String orderNo) throws SQLException;
}
