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
	
	// 수거 리스트 가져오기
	@Override
	public Map<String, Object> getPickupWaitList(LaundryOrderVO laundryOrder) throws Exception {
		Map<String, Object> dataMap = new HashMap<String, Object>();
		
		List<LaundryOrderVO> pickupList = deliveryDAO.selectPickupWait(laundryOrder);
		List<LaundryOrderVO> pickupCompleteList = deliveryDAO.selectPickupCompleteList(laundryOrder);
		
		dataMap.put("pickupList", pickupList);
		dataMap.put("pickupCompleteList", pickupCompleteList);
		
		return dataMap;
	}
	//수거완료(상태 변경)
	@Override
	public void updatePickUpCom(LaundryOrderVO laundryOrder) throws Exception {
		deliveryDAO.updatePickUpCom(laundryOrder);
		
	}
	
	
	//배송 리스트
	@Override
	public Map<String, Object> getDeliveryList(LaundryOrderVO laundryOrder) throws Exception {
		Map<String, Object> dataMap = new HashMap<String, Object>();
		
		List<LaundryOrderVO> deliveryList = deliveryDAO.selectDeliveryList(laundryOrder);
		List<LaundryOrderVO> deliveryCompleteList = deliveryDAO.selectDeliveryComList(laundryOrder);
		
		dataMap.put("deliveryList",deliveryList);
		dataMap.put("deliveryCompleteList",deliveryCompleteList);
		
		return dataMap;
	}
	//배송 완료ㆍ취소(상태버튼)
	
	
	
	// 수거ㆍ배송 상세
	@Override
	public Map<String, Object> getOrderDetailByOrderNo(String orderNo) throws Exception {
		Map<String, Object> dataMap = new HashMap<String, Object>();
		
		LaundryOrderVO detail = deliveryDAO.selectOrderByOrderNo(orderNo);
		List<LaundryOrderDetailVO> detailList = deliveryDAO.selectOrdertDetailList(orderNo);
		
		dataMap.put("detail", detail);
		dataMap.put("detailList", detailList);
		
		return dataMap;
	}
}
