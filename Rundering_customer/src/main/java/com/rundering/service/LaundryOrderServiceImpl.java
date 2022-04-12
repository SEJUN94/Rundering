package com.rundering.service;

import java.sql.SQLException;
import java.util.Calendar;
import java.util.Date;

import com.rundering.dao.LaundryOrderDAO;
import com.rundering.dto.LaundryOrderVO;

public class LaundryOrderServiceImpl implements LaundryOrderService {
	
	private LaundryOrderDAO laundryOrderDAO;
	public void setLaundryOrderDAO(LaundryOrderDAO laundryOrderDAO) {
		this.laundryOrderDAO = laundryOrderDAO;
	}
	
	//세탁주문접수
	@Override
	public void orderReceive(LaundryOrderVO laundryOrder) throws SQLException {
		//주문번호 시퀀스로 가져오기
		String orderNo = laundryOrderDAO.selectLaundryOrderSequenceNextValue();
		laundryOrder.setOrderNo(orderNo);
		
		//수거요청일에 2일 더해서 배송요청일 설정
		Date pickupRequestDate = laundryOrder.getPickupRequestDate();
		Calendar cal = Calendar.getInstance(); 
		cal.setTime(pickupRequestDate);
		cal.add(Calendar.DATE, 2);
		Date deliveryRequestDate = cal.getTime();
		laundryOrder.setDeliveryRequestDate(deliveryRequestDate);
		
		//공통코드 수거대기상태 -> 01
		laundryOrder.setOrderStatus("01");
		
		laundryOrderDAO.insertLaundryOrder(laundryOrder);
	}

}
