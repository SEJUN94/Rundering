package com.rundering.dao;

import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.rundering.command.ItemOrderDetailCommand;
import com.rundering.dto.ItemOrderDetailVO;
import com.rundering.dto.ItemOrderVO;
import com.rundering.manage.Criteria;

public class ItemOrderDAOImpl implements ItemOrderDAO{
	private SqlSession session;
	
	public void setSession(SqlSession session) {
		this.session = session;
	}
	
	@Override
	public List<ItemOrderDetailCommand> selectSearchItemOrderList(Criteria cri) throws SQLException {
		List<ItemOrderDetailCommand> itemOrderList = session.selectList("ItemOrder-mapper.selectSearchItemOrder", cri);
		return itemOrderList;
	}

	@Override
	public int selectSearchItemOrderListCount(Criteria cri) throws SQLException {
		int count = session.selectOne("ItemOrder-mapper.selectSearchItemOrderCount", cri);
		return count;
	}

	@Override
	public ItemOrderDetailCommand selectItemOrderListBySEQ(int seq) throws SQLException {
		ItemOrderDetailCommand itemOrderDetailList = session.selectOne("ItemOrder-mapper.selectItemOrderBySeq", seq);
		return itemOrderDetailList;
	}
	
	
	
	
}
