package com.rundering.service;

import java.util.List;
import java.util.Map;

import com.rundering.command.Criteria;
import com.rundering.dto.LaundryOrderDetailVO;
import com.rundering.dto.LaundryOrderVO;

public interface DeliveryService {
	
	List<LaundryOrderVO> getDeliveryList(String orderStatus) throws Exception;
	
	Map<String, Object> getDeliveryByOrderNo(String orderNo) throws Exception;
	
}
