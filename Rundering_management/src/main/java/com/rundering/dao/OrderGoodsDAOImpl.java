package com.rundering.dao;

import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;

import com.rundering.manage.Criteria;
import com.rundering.dto.LaundryArticlesVO;

public class OrderGoodsDAOImpl implements OrderGoodsDAO{
	private SqlSession session;

	public void setSession(SqlSession session) {
		this.session = session;
	}
	@Override
	public List<LaundryArticlesVO> orderGoods(Criteria cri) throws SQLException {
		
		int offset=cri.getStartRowNum();
		int limit=cri.getPerPageNum();		
		RowBounds rowBounds=new RowBounds(offset,limit);		
		
		List<LaundryArticlesVO> orderGoodsList=
				session.selectList("OrderGoods-Mapper.orderGoodsList",cri,rowBounds);
		
		return orderGoodsList;
	}
	@Override
	public int selectOrderGoodsCriteriaTotalCount(Criteria cri) throws SQLException {
		int count=session.selectOne("OrderGoods-Mapper.selectSearchOrderGoodsListCount",cri);
		return count;
	}
	
	@Override
	public LaundryArticlesVO selectOrderGoodsByArticlesCode(String articlesCode)
			throws SQLException {
		LaundryArticlesVO ordergoods=
				session.selectOne("OrderGoods-Mapper.selectOrderGoodsByBno",articlesCode);
		return ordergoods;
	}

	@Override
	public void insertOrderGoods(LaundryArticlesVO ordergoods) throws SQLException {
		session.update("OrderGoods-Mapper.insertOrderGoods",ordergoods);
	}

	@Override
	public void updateOrderGoods(LaundryArticlesVO ordergoods) throws SQLException {
		session.update("OrderGoods-Mapper.updateOrderGoods",ordergoods);
	}

	@Override
	public void deleteOrderGoods(String articlesCode) throws SQLException {
		session.update("OrderGoods-Mapper.deleteOrderGoods",articlesCode);
	}

	
	
}
