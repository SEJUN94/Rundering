package com.rundering.dao;

import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.jsp.command.Criteria;
import com.rundering.dto.ArticlesLaundryVO;

public interface OrderGoodsDAO {
	List<ArticlesLaundryVO> orderGoods(SqlSession session, Criteria cri) throws SQLException;
	
	int selectOrderGoodsCriteriaTotalCount(SqlSession session,Criteria cri) throws SQLException;
	
	ArticlesLaundryVO selectOrderGoodsBylndrwaterqlyCode(SqlSession session, String lndrwaterqlyCode) throws SQLException;

	void insertOrderGoods(SqlSession session,ArticlesLaundryVO ordergoods) throws SQLException;

	void updateOrderGoods(SqlSession session,ArticlesLaundryVO ordergoods) throws SQLException;

	void deleteOrderGoods(SqlSession session,String lndrwaterqlyCode) throws SQLException;
}
