package com.rundering.dao;

import java.sql.SQLException;

import com.rundering.dto.PaymentVO;

public interface PaymentDAO {
	
	// 결제등록
	public void insertPayment(PaymentVO payment) throws SQLException;
	// 주문번호 설정
	public void updatePaymentOrderNo(PaymentVO payment) throws SQLException;
	// 결제 취소
	public void cancelPayment(String orderNo) throws Exception;
}
