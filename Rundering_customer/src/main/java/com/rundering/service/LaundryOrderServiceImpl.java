package com.rundering.service;

import java.sql.SQLException;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.rundering.dao.LaundryItemsDAO;
import com.rundering.dao.LaundryOrderDAO;
import com.rundering.dao.LaundryOrderDetailDAO;
import com.rundering.dao.MemberAddressDAO;
import com.rundering.dao.PaymentDAO;
import com.rundering.dto.LaundryItemsVO;
import com.rundering.dto.LaundryOrderDetailVO;
import com.rundering.dto.LaundryOrderVO;
import com.rundering.dto.PaymentVO;

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
	private PaymentDAO paymentDAO;
	public void setPaymentDAO(PaymentDAO paymentDAO) {
		this.paymentDAO = paymentDAO;
	}
	
	//세탁주문접수
	@Override
	public String orderReceive(LaundryOrderVO laundryOrder, List<LaundryOrderDetailVO> laundryOrderDetailVOList) throws SQLException {
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
		
		//결제테이블 세탁주문번호update
		PaymentVO payment = new PaymentVO();
		payment.setOrderNo(orderNo);
		payment.setPaymentNo(laundryOrder.getPaymentNo());
		paymentDAO.updatePaymentOrderNo(payment);
		return orderNo;
		
	}

	@Override
	public Map<String, Object> checkOrder(List<LaundryOrderDetailVO> laundryOrderDetailVOList)
			throws SQLException {
		Map<String, Object> dataMap = new HashMap<String, Object>();
		int totalPrice = 0;
		
		StringBuilder builder = new StringBuilder();
		for (LaundryOrderDetailVO laundryOrderDetail : laundryOrderDetailVOList) {
			//가격, 품목명 조회 후 설정
			LaundryItemsVO laundryItems = laundryItemsDAO.selectLaundryItemsBylaundryItemsCode(laundryOrderDetail.getLaundryItemsCode());
			int price = laundryItems.getPrice() * laundryOrderDetail.getQuantity();
			totalPrice += price;
			laundryOrderDetail.setPrice(price);
			laundryOrderDetail.setItemsName(laundryItems.getItemsName());
			builder.append(laundryOrderDetail.getItemsName());
			builder.append(", ");
		}
		//주문명 설정 - 품목명+품목명+...
		String orderName = builder.toString();
		orderName = orderName.substring(0, orderName.length() - 2);
		if(orderName.length() > 12) {
			orderName = orderName.substring(0, 12);
			builder.setLength(0);
			builder.append(orderName);
			builder.append("...");
			orderName = builder.toString();
		}
		
		dataMap.put("confirmedOrderDetailVOList", laundryOrderDetailVOList);
		dataMap.put("totalPrice", totalPrice);
		dataMap.put("orderName", orderName);
		
		return dataMap;
	}

	@Override
	public LaundryOrderVO getLaundryOrder(String orderNo) throws SQLException {
		return laundryOrderDAO.selectLaundryOrderByOrderNo(orderNo);
	}
}
