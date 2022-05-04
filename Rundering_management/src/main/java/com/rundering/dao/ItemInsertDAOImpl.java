package com.rundering.dao;

import org.apache.ibatis.session.SqlSession;

import com.rundering.dto.ItemInsertVO;
import com.rundering.dto.ItemVO;

public class ItemInsertDAOImpl implements ItemInsertDAO {
	SqlSession session;
	public void setSession(SqlSession session) {
		this.session = session;
	}
	
	@Override
	public void insertItemIsert(ItemInsertVO itemInsert) throws Exception {
		session.insert("ItemInsert-Mapper.insertItemIsert", itemInsert);
	}

	@Override
	public ItemVO selectDayItemByItem(ItemVO item) throws Exception {
		return session.selectOne("selectDayItemByItem",item);
	}


	
}
