package com.rundering.dao;

import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.rundering.dto.ItemOrderDetailVO;
import com.rundering.dto.ItemOrderVO;
import com.rundering.manage.Criteria;

public class AdminItemOrderDAOImpl implements AdminItemOrderDAO{
	private SqlSession session;
	
	public void setSession(SqlSession session) {
		this.session = session;
	}
	@Override
	public List<ItemOrderVO> selectSearchItemOrderList(Criteria cri) throws SQLException {
		List<ItemOrderVO> itemOrderList = session.selectList("AdminItemOrder-mapper.selectSearchItemOrder", cri);
		return itemOrderList;
	}

	@Override
	public int selectSearchItemOrderListCount(Criteria cri) throws SQLException {
		int count = session.selectOne("AdminItemOrder-mapper.selectSearchItemOrderCount", cri);
		return count;
	}

	@Override
	public ItemOrderVO selectItemOrderDetail(String ordercode) throws SQLException {
		ItemOrderVO itemOrder = session.selectOne("AdminItemOrder-mapper.selectItemOrderDetailByOrderCode", ordercode);
		return itemOrder;
	}

	@Override
	public List<ItemOrderDetailVO> selectItemOrderDetailList(String ordercode) throws SQLException {
		List<ItemOrderDetailVO> itemOrderDetail = session.selectList("AdminItemOrder-mapper.selectItemOrderDetail", ordercode);
		return itemOrderDetail;
	}
	@Override
	public void modifyStatus(ItemOrderVO itemOrder) throws SQLException {
		session.selectOne("AdminItemOrder-mapper.modifyStatus",itemOrder);
	}
	
}
