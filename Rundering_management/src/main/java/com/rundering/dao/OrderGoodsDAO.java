package com.rundering.dao;

import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.jsp.command.Criteria;
import com.rundering.dto.LaundryArticlesVO;

public interface OrderGoodsDAO {
	List<LaundryArticlesVO> orderGoods(Criteria cri) throws SQLException;
	
	int selectOrderGoodsCriteriaTotalCount(Criteria cri) throws SQLException;
	
	LaundryArticlesVO selectOrderGoodsByArticlesCode(String articlesCode) throws SQLException;

	void insertOrderGoods(LaundryArticlesVO ordergoods) throws SQLException;

	void updateOrderGoods(LaundryArticlesVO ordergoods) throws SQLException;

	void deleteOrderGoods(String articlesCode) throws SQLException;
}
