package com.rundering.dao;

import java.sql.SQLException;

import com.rundering.dto.LaundryOrderDetailVO;

public interface LaundryOrderDetailDAO {
	
	// 세탁주문상세 등록
	public void insertLaundryOrderDetail(LaundryOrderDetailVO laundryOrderDetail) throws SQLException;
		

}
