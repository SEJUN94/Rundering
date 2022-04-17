package com.rundering.dao;

import org.apache.ibatis.session.SqlSession;

import com.rundering.dto.ItemOrderDetailVO;
import com.rundering.dto.ItemOrderVO;

public class ItemOrderDAOImpl implements ItemOrderDAO{

	SqlSession session;
	
	public void setSession(SqlSession session) {
		this.session = session;
	}
	
	@Override
	public SqlSession insertItemOrderByItmeOrder(ItemOrderVO itemOrder) throws Exception {
		
		 session.insert("ItmeOrder-Mapper.insertItemOrderByItmeOrder", itemOrder);
		
		 return session;
		
	}

	@Override
	public void insertItemOrderDetailByItmeOrderDetail(ItemOrderDetailVO itemOrderDetail) throws Exception {
		session.insert("itemOrder-Mapper.insertItemOrderDetailByItmeOrderDetail", itemOrderDetail);
		
	}
	

}
