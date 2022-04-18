package com.rundering.dao;

import org.apache.ibatis.session.SqlSession;

import com.rundering.dto.ItemOrderDetailVO;
import com.rundering.dto.ItemOrderVO;

public interface ItemOrderDAO {
	public void insertItemOrderByItmeOrder(ItemOrderVO itemOrder) throws Exception;
	public void insertItemOrderDetailByItmeOrderDetail(ItemOrderDetailVO itemOrderDetail) throws Exception;
	public String seq() throws Exception;
	public void itemOrderRemove(String seq) throws Exception;
	public void itemOrderDetailRemove(String seq) throws Exception;
} 