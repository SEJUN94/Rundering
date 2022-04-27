package com.rundering.dao;

import java.util.List;

import com.rundering.dto.LaundryOrderDetailVO;
import com.rundering.dto.LaundryOrderVO;

public interface DeliveryDAO {
	List<LaundryOrderVO> selectDeliveryList(String orderStatus) throws Exception;
 
	//배송 상세
	LaundryOrderVO selectDeliveryByOrderNo(String orderNo) throws Exception;
	List<LaundryOrderDetailVO> selectOrderListByOrderNo(String orderNo) throws Exception;
	
	
}
