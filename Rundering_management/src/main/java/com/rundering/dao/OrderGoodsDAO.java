package com.rundering.dao;

import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.jsp.command.Criteria;
import com.rundering.dto.ArticlesLaundryVO;

public interface OrderGoodsDAO {
	List<ArticlesLaundryVO> orderGoods(Criteria cri) throws SQLException;
	
	int selectOrderGoodsCriteriaTotalCount(Criteria cri) throws SQLException;
	
	ArticlesLaundryVO selectOrderGoodsBylndrwaterqlyCode(String lndrwaterqlyCode) throws SQLException;

	void insertOrderGoods(ArticlesLaundryVO ordergoods) throws SQLException;

	void updateOrderGoods(ArticlesLaundryVO ordergoods) throws SQLException;

	void deleteOrderGoods(String lndrwaterqlyCode) throws SQLException;
}
