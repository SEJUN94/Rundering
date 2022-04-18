package com.rundering.dao;

import java.sql.SQLException;
import java.util.List;

import com.rundering.command.ItemOrderDetailCommand;
import com.rundering.dto.ItemOrderDetailVO;
import com.rundering.dto.ItemOrderVO;
import com.rundering.manage.Criteria;

public interface ItemOrderDAO {
	
	public List<ItemOrderDetailCommand> selectSearchItemOrderList(Criteria cri) throws SQLException;
	
	public int selectSearchItemOrderListCount(Criteria cri) throws SQLException;
	
	public ItemOrderDetailCommand selectItemOrderListBySEQ(int seq) throws SQLException;
}
