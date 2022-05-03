package com.rundering.dao;

import org.apache.ibatis.session.SqlSession;

import com.rundering.dto.LaundryGoodsStockVO;

public class LaundryGoodsStockDAOImpl implements LaundryGoodsStockDAO{
	SqlSession session;
	
	public void setSession(SqlSession session) {
		this.session = session;
	}
	
	@Override
	public void insertLaundryGoodsStock(LaundryGoodsStockVO laundryGoodsStock) throws Exception {
		session.insert("LaundryGoodsStock-Mapper.insertLaundryGoodsStock",laundryGoodsStock);
	}


}
