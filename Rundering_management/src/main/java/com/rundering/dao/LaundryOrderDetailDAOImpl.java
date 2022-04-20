package com.rundering.dao;

import java.sql.SQLException;

import org.apache.ibatis.session.SqlSession;

import com.rundering.dto.LaundryOrderDetailVO;

public class LaundryOrderDetailDAOImpl implements LaundryOrderDetailDAO{
	
	private SqlSession session;
	public void setSession(SqlSession session) {
		this.session = session;
	}
	
	// 세탁주문상세 등록
	@Override
	public void insertLaundryOrderDetail(LaundryOrderDetailVO laundryOrderDetail) throws SQLException {
		session.update("LaundryOrderDetail-Mapper.insertLaundryOrderDetail",laundryOrderDetail);
	}

}
