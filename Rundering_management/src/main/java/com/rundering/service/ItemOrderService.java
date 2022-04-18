package com.rundering.service;

import java.sql.SQLException;
import java.util.Map;

import com.rundering.command.ItemOrderDetailCommand;
import com.rundering.manage.Criteria;

public interface ItemOrderService {
	public Map<String, Object> getItemOrderList(Criteria cri) throws SQLException;

	public ItemOrderDetailCommand getItemOrderDetailList(int seq) throws SQLException;
}
