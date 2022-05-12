package com.rundering.dao;

import java.sql.SQLException;

import org.apache.ibatis.session.SqlSession;

import com.rundering.dto.PaymentVO;

public class PaymentDAOImpl implements PaymentDAO{
	
	private SqlSession session;
	public void setSession(SqlSession session) {
		this.session = session;
	}

	@Override
	public void insertPayment(PaymentVO payment) throws SQLException {
		session.update("Payment-Mapper.insertPayment", payment);
	}

	@Override
	public void updatePaymentOrderNo(PaymentVO payment) throws SQLException {
		session.update("Payment-Mapper.updatePaymentOrderNo", payment);
	}

	// 결제 취소
	@Override
	public void cancelPayment(String orderNo) throws Exception {
		session.update("Payment-Mapper.cancelPayment", orderNo);
	}

}
