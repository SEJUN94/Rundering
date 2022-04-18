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
	public void insertItemOrderByItmeOrder(ItemOrderVO itemOrder) throws Exception {
		
		 session.insert("ItemOrder-Mapper.insertItemOrderByItmeOrder", itemOrder);
		
	}

	@Override
	public void insertItemOrderDetailByItmeOrderDetail(ItemOrderDetailVO itemOrderDetail) throws Exception {
		session.insert("ItemOrder-Mapper.insertItemOrderDetailByDetail", itemOrderDetail);
		
	}
	@Override
	public String seq() throws Exception{
		String seq = session.selectOne("ItemOrder-Mapper.seq");
		return seq;
	}
	@Override
	public void itemOrderRemove(String seq) throws Exception{
		session.delete("ItemOrder-Mapper.itemOrderRemove",seq);
	}
	@Override
	public void itemOrderDetailRemove(String seq) throws Exception {
		session.delete("ItemOrder-Mapper.itemOrderDetailRemove",seq);
	}
	

}
