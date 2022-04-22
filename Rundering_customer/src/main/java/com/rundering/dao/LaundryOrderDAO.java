package com.rundering.dao;

import java.sql.SQLException;

import com.rundering.dto.LaundryOrderVO;

public interface LaundryOrderDAO {
	
	// 세탁주문번호생성
	public String selectLaundryOrderSequenceNextValue() throws SQLException;
	
	// 세탁주문접수
	public void insertLaundryOrder(LaundryOrderVO laundryOrder) throws SQLException;
	
	// 세탁주문조회 - 주문번호로
	public LaundryOrderVO selectLaundryOrderByOrderNo(String orderNo) throws SQLException;
			
	
}
