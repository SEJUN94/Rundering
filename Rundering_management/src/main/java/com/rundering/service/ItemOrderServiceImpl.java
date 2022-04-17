package com.rundering.service;

import org.apache.ibatis.session.SqlSession;

import com.rundering.dao.ItemOrderDAO;
import com.rundering.dto.ItemOrderDetailVO;
import com.rundering.dto.ItemOrderVO;

public class ItemOrderServiceImpl implements ItemOrderService {
		
	ItemOrderDAO itemOrderDAO;
	
	public void setItemOrderDAO(ItemOrderDAO itemOrderDAO) {
		this.itemOrderDAO = itemOrderDAO;
	}
	
	@Override
	public void insertItemOrder(ItemOrderVO itemOrder,ItemOrderDetailVO itemOrderDetail) throws Exception {
		SqlSession session = null;
		
		session = itemOrderDAO.insertItemOrderByItmeOrder(itemOrder);
		try {
			itemOrderDAO.insertItemOrderDetailByItmeOrderDetail(itemOrderDetail);
		} catch (Exception e) {
			session.rollback();
		}
		
		
	}
	
	
	


}
