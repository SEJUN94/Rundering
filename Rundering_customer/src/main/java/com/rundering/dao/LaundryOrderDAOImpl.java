package com.rundering.dao;

import java.sql.SQLException;

import org.apache.ibatis.session.SqlSession;

import com.rundering.dto.LaundryOrderVO;

public class LaundryOrderDAOImpl implements LaundryOrderDAO{
	
	private SqlSession session;
	public void setSession(SqlSession session) {
		this.session = session;
	}
	
	// 세탁주문번호생성
	@Override
	public String selectLaundryOrderSequenceNextValue() throws SQLException {
		String orderNo = session.selectOne("LaundryOrder-Mapper.selectLaundryOrderSequenceNextValue");
		return orderNo;
	}
	
	// 세탁주문접수
	@Override
	public void insertLaundryOrder(LaundryOrderVO laundryOrder) throws SQLException {
		session.update("LaundryOrder-Mapper.insertLaundryOrder", laundryOrder);
	}


}
