package com.rundering.service;

import java.sql.SQLException;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import com.rundering.dao.LaundryItemsDAO;
import com.rundering.dao.LaundryOrderDAO;
import com.rundering.dao.LaundryOrderDetailDAO;
import com.rundering.dao.MemberAddressDAO;
import com.rundering.dto.LaundryItemsVO;
import com.rundering.dto.LaundryOrderDetailVO;
import com.rundering.dto.LaundryOrderVO;

public class LaundryOrderServiceImpl implements LaundryOrderService {
	
	private LaundryOrderDAO laundryOrderDAO;
	public void setLaundryOrderDAO(LaundryOrderDAO laundryOrderDAO) {
		this.laundryOrderDAO = laundryOrderDAO;
	}
	private LaundryOrderDetailDAO laundryOrderDetailDAO;
	public void setLaundryOrderDetailDAO(LaundryOrderDetailDAO laundryOrderDetailDAO) {
		this.laundryOrderDetailDAO = laundryOrderDetailDAO;
	}
	private LaundryItemsDAO laundryItemsDAO;
	public void setLaundryItemsDAO(LaundryItemsDAO laundryItemsDAO) {
		this.laundryItemsDAO = laundryItemsDAO;
	}
	
	//세탁주문접수
	@Override
	public void orderReceive(LaundryOrderVO laundryOrder, List<LaundryOrderDetailVO> laundryOrderDetailVOList) throws SQLException {
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
		
		
		//세탁주문테이블 insert
		laundryOrderDAO.insertLaundryOrder(laundryOrder);
		
		//세탁주문상세테이블 insert
		for (int i = 0; i < laundryOrderDetailVOList.size(); i++) {
			LaundryOrderDetailVO laundryOrderDetail = laundryOrderDetailVOList.get(i);
			laundryOrderDetail.setOrderNo(orderNo);
			laundryOrderDetail.setDetailOrderno(String.format("%04d", i+1));
			//가격, 품목명 조회 후 설정
			LaundryItemsVO laundryItems = laundryItemsDAO.selectLaundryItemsBylaundryItemsCode(laundryOrderDetail.getLaundryItemsCode());
			int price = laundryItems.getPrice() * laundryOrderDetail.getQuantity();
			laundryOrderDetail.setPrice(price);
			laundryOrderDetail.setItemsName(laundryItems.getItemsName());
			
			laundryOrderDetailDAO.insertLaundryOrderDetail(laundryOrderDetail);
		}
	}
}
