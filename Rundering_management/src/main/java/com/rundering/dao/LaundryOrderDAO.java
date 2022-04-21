package com.rundering.dao;

import java.sql.SQLException;
import java.util.List;

import com.rundering.dto.LaundryOrderVO;
import com.rundering.manage.Criteria;
import com.rundering.util.BranchCriteria;

public interface LaundryOrderDAO {
	
	// 세탁주문번호생성
	public String selectLaundryOrderSequenceNextValue() throws SQLException;
	
	// 세탁주문접수
	public void insertLaundryOrder(LaundryOrderVO laundryOrder) throws SQLException;

	public List<LaundryOrderVO> selectLaundryOrderList(BranchCriteria cri) throws Exception;

	public int selectCount(BranchCriteria cri) throws Exception;
			
	
}
