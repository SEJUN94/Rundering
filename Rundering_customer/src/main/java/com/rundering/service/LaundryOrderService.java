package com.rundering.service;

import java.sql.SQLException;
import java.util.List;

import com.rundering.dto.LaundryOrderDetailVO;
import com.rundering.dto.LaundryOrderVO;

public interface LaundryOrderService {
	
	// 세탁주문접수
	void orderReceive(LaundryOrderVO laundryOrder, List<LaundryOrderDetailVO> laundryOrderDetailVOList) throws SQLException;
			
	
}
