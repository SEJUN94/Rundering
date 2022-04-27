package com.rundering.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.rundering.dao.DeliveryDAO;
import com.rundering.dto.LaundryOrderDetailVO;
import com.rundering.dto.LaundryOrderVO;

public class DeliveryServiceImpl implements DeliveryService{

	private DeliveryDAO deliveryDAO;
	
	public void setLaundryOrderDAO(DeliveryDAO deliveryDAO) {
		this.deliveryDAO = deliveryDAO;
	}
	
	@Override
	public List<LaundryOrderVO> getDeliveryList(String orderStatus) throws Exception {
		
		List<LaundryOrderVO> deliveryList = deliveryDAO.selectDeliveryList(orderStatus);
		
		return deliveryList;
	}
 
	@Override
	public Map<String, Object> getDeliveryByOrderNo(String orderNo) throws Exception {
		Map<String, Object> dataMap = new HashMap<String, Object>();
		
		LaundryOrderVO delivery = deliveryDAO.selectDeliveryByOrderNo(orderNo);
		List<LaundryOrderDetailVO> orderList = deliveryDAO.selectOrderListByOrderNo(orderNo);
		
		dataMap.put("delivery", delivery);
		dataMap.put("orderList", orderList);
		
		return dataMap;
		
	}

}
