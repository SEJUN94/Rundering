package com.rundering.dao;

import java.sql.SQLException;
import java.util.List;

import com.rundering.command.BranchCriteria;
import com.rundering.command.Criteria;
import com.rundering.dto.LaundryOrderVO;

public interface LaundryOrderDAO {
	
	//지점 - 세탁주문목록
	public List<LaundryOrderVO> selectLaundryOrderList(BranchCriteria cri) throws Exception;
	//본사 - 세탁주문목록
	public List<LaundryOrderVO> selectAdminLaundryOrderList(Criteria cri) throws Exception;

	public int selectCount(BranchCriteria cri) throws Exception;
	public int selectCount(Criteria cri) throws Exception;
	public void updateLaundryOrderStatusByOrderNo(LaundryOrderVO laundryOrderVO) throws Exception;		
	
	//본사 - 세탁주문조회
	public LaundryOrderVO selectLaundryOrderByOrderNo(String orderNo) throws SQLException;
	//지점할당되지 않은 오늘이 수거요청일인 주문 목록 - By area
	public List<LaundryOrderVO> selectLaundryOrderListNotAssignedToBranchByArea(String area) throws Exception;
	//지점할당
	public void updateLaundryOrderbranchCode(LaundryOrderVO laundryOrder) throws Exception;
	
}
