package com.rundering.service;

import java.sql.SQLException;
import java.util.Map;

import com.rundering.dto.ItemOrderVO;
import com.rundering.manage.Criteria;

public interface ItemOrderService {
	public Map<String, Object> getItemOrderList(Criteria cri) throws SQLException;
	
	public Map<String, Object> getItemOrderDetailList(String ordercode) throws SQLException;
	
	public void modifyStatus(ItemOrderVO itemOrder)throws SQLException;
}
