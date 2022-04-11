package com.rundering.dao;

import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.rundering.dto.ArticlesLaundryVO;

public class OrderGoodsDAOImpl implements OrderGoodsDAO{
	private SqlSession session;
	private OrderGoodsDAO dao;

	public void setSession(SqlSession session) {
		this.session = session;
	}

	public void setBoardDAO(OrderGoodsDAO dao) {
		this.dao = dao;
	}
	@Override
	public List<ArticlesLaundryVO> orderGoods() throws SQLException {
		return dao.orderGoods();
	}
	
}
