package com.rundering.dao;

import java.sql.SQLException;
import java.util.List;

import com.rundering.command.MyOrderCriteria;
import com.rundering.dto.LaundryOrderVO;

public interface LaundryOrderDAO {
	
	// 세탁주문번호생성
	public String selectLaundryOrderSequenceNextValue() throws SQLException;
	
	// 세탁주문접수
	public void insertLaundryOrder(LaundryOrderVO laundryOrder) throws SQLException;
	
	// 세탁주문조회 - 주문번호로
	public LaundryOrderVO selectLaundryOrderByOrderNo(String orderNo) throws SQLException;
	
	// 마이페이지 - 내 주문내역 가져오기
	public List<LaundryOrderVO> getMyOrderList(MyOrderCriteria cri) throws Exception;

	// 마이페이지 - 완료된 내 주문내역 가져오기
	public List<LaundryOrderVO> getMyCompleteOrderList(MyOrderCriteria cri) throws Exception;
	
	// 마이페이지 - 주문내역 전체 개수 체크
	public int myOrderList(MyOrderCriteria cri) throws SQLException;
	
	// 마이페이지 - 완료된 주문내역 개수 체크
	public int myCompleteOrderList(MyOrderCriteria cri) throws SQLException;
	
}
