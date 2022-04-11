package com.rundering.dao;

import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;

import com.jsp.command.Criteria;
import com.rundering.dto.ArticlesLaundryVO;

public class OrderGoodsDAOImpl implements OrderGoodsDAO{
	private SqlSession session;

	public void setSession(SqlSession session) {
		this.session = session;
	}
	
	@Override
	public List<ArticlesLaundryVO> orderGoods(SqlSession session,Criteria cri) throws SQLException {
		
		int offset=cri.getStartRowNum();
		int limit=cri.getPerPageNum();		
		RowBounds rowBounds=new RowBounds(offset,limit);		
		
		List<ArticlesLaundryVO> boardList=
				session.selectList("OrderGoods-mapper.orderGoodsList",cri,rowBounds);
		
		return boardList;
	}

	@Override
	public int selectOrderGoodsCriteriaTotalCount(SqlSession session, Criteria cri) throws SQLException {
		int count=session.selectOne("OrderGoods-Mapper.selectSearchOrderGoodsListCount",cri);
		return count;
	}
	
	@Override
	public ArticlesLaundryVO selectOrderGoodsBylndrwaterqlyCode(SqlSession session, String lndrwaterqlyCode)
			throws SQLException {
		ArticlesLaundryVO ordergoods=
				session.selectOne("OrderGoods-mapper.orderGoodsList",lndrwaterqlyCode);
		return ordergoods;
	}

	@Override
	public void insertOrderGoods(SqlSession session, ArticlesLaundryVO ordergoods) throws SQLException {
		session.update("OrderGoods-mapper.insertOrderGoods",ordergoods);
	}

	@Override
	public void updateOrderGoods(SqlSession session, ArticlesLaundryVO ordergoods) throws SQLException {
		session.update("OrderGoods-mapper.updateOrderGoods",ordergoods);
	}

	@Override
	public void deleteOrderGoods(SqlSession session, String lndrwaterqlyCode) throws SQLException {
		session.update("OrderGoods-mapper.deleteOrderGoods",lndrwaterqlyCode);
	}

	
	
}
