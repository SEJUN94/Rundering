package com.rundering.service;

import java.util.Map;

import com.rundering.dto.LaundryOrderVO;

public interface DeliveryService { 
	//수거 리스트
	Map<String, Object> getPickupWaitList(LaundryOrderVO laundryOrder) throws Exception;
	//수거 완료ㆍ취소(상태 변경)
	void updatePickUpCom(LaundryOrderVO laundryOrder) throws Exception;
	//배송 리스트
	Map<String, Object> getDeliveryList(LaundryOrderVO laundryOrder) throws Exception;
	//배송 완료ㆍ취소(상태버튼)
	
	//수거ㆍ배송 상세
	Map<String, Object> getOrderDetailByOrderNo(String orderNo) throws Exception;
	
}
