package com.rundering.service;

import java.sql.SQLException;

import com.rundering.dto.LaundryOrderVO;

public interface LaundryOrderService {
	
	// 세탁주문접수
	void orderReceive(LaundryOrderVO laundryOrder) throws SQLException;
			
	
}
