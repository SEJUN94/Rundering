package com.rundering.dao;

import java.sql.SQLException;
import java.util.List;

import com.rundering.command.BranchCriteria;
import com.rundering.command.Criteria;
import com.rundering.dto.LaundryOrderVO;

public interface LaundryOrderDAO {
	
	// 세탁주문번호생성
	public String selectLaundryOrderSequenceNextValue() throws SQLException;
	
	// 세탁주문접수
	public void insertLaundryOrder(LaundryOrderVO laundryOrder) throws SQLException;
	
	//지점 - 세탁주문목록
	public List<LaundryOrderVO> selectLaundryOrderList(BranchCriteria cri) throws Exception;
	//본사 - 세탁주문목록
	public List<LaundryOrderVO> selectAdminLaundryOrderList(Criteria cri) throws Exception;

	public int selectCount(BranchCriteria cri) throws Exception;
	public int selectCount(Criteria cri) throws Exception;
	public void updateLaundryOrderStatusByOrderNo(LaundryOrderVO laundryOrderVO) throws Exception;		
	
	//본사 - 세탁주문조회
	public LaundryOrderVO selectLaundryOrderByOrderNo(String orderNo) throws SQLException;
	
}
