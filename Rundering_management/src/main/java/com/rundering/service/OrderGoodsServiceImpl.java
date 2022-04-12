package com.rundering.service;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.jsp.command.Criteria;
import com.jsp.command.PageMaker;
import com.rundering.dao.OrderGoodsDAO;
import com.rundering.dao.OrderGoodsDAOImpl;
import com.rundering.dto.ArticlesLaundryVO;

public class OrderGoodsServiceImpl implements OrderGoodsService {

	private SqlSessionFactory sqlSessionFactory;

	public void setSqlSessionFactory(SqlSessionFactory sqlSessionFactory) {
		this.sqlSessionFactory = sqlSessionFactory;
	}
	private OrderGoodsDAO orderGoodsDAO;

	public void setOrderGoodsDAO(OrderGoodsDAO orderGoodsDAO) {
		this.orderGoodsDAO = orderGoodsDAO;
	}

	@Override
	public Map<String, Object> getOrderGoods(Criteria cri) throws SQLException {
		SqlSession session = sqlSessionFactory.openSession();
		try {
			Map<String, Object> dataMap = new HashMap<String, Object>();

			List<ArticlesLaundryVO> orderGoodsList = orderGoodsDAO.orderGoods(cri);

			// 전체 board 개수
			int totalCount = orderGoodsDAO.selectOrderGoodsCriteriaTotalCount(cri);
			// PageMaker 생성.
			PageMaker pageMaker = new PageMaker();
			pageMaker.setCri(cri);
			pageMaker.setTotalCount(totalCount);

			dataMap.put("orderGoodsList", orderGoodsList);
			dataMap.put("pageMaker", pageMaker);

			return dataMap;
		} finally {
			session.close();
		}
	}

	@Override
	public ArticlesLaundryVO getOrderGoods(String lndrwaterqlyCode) throws SQLException {
		SqlSession session = sqlSessionFactory.openSession();
		try {
			ArticlesLaundryVO ordergoods = orderGoodsDAO.selectOrderGoodsBylndrwaterqlyCode(lndrwaterqlyCode);
			return ordergoods;
		} finally {
			session.close();
		}
	}

	@Override
	public void regist(ArticlesLaundryVO ordergoods) throws SQLException {
		SqlSession session = sqlSessionFactory.openSession();
		try {
			orderGoodsDAO.insertOrderGoods(ordergoods);
		} finally {
			session.close();
		}
		
	}

	@Override
	public void modify(ArticlesLaundryVO ordergoods) throws SQLException {
		SqlSession session = sqlSessionFactory.openSession();
		try {
			orderGoodsDAO.updateOrderGoods(ordergoods);
		} finally {
			session.close();
		}
	}

	@Override
	public void remove(String lndrwaterqlyCode) throws SQLException {
		SqlSession session = sqlSessionFactory.openSession();
		try {
			orderGoodsDAO.deleteOrderGoods(lndrwaterqlyCode);
		} finally {
			session.close();
		}
		
	}

}
