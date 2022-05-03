package com.rundering.dao;

import org.apache.ibatis.session.SqlSession;

import com.rundering.dto.ItemInsertVO;

public class ItemInsertDAOImpl implements ItemInsertDAO {
	SqlSession session;
	public void setSession(SqlSession session) {
		this.session = session;
	}
	
	@Override
	public void insertItemIsert(ItemInsertVO itemInsert) throws Exception {
		session.insert("ItemInsert-Mapper.insertItemIsert", itemInsert);
	}

}
