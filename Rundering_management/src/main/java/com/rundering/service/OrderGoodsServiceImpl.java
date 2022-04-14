package com.rundering.service;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.rundering.manage.Criteria;
import com.rundering.manage.PageMaker;
import com.rundering.dao.OrderGoodsDAO;
import com.rundering.dto.LaundryArticlesVO;

public class OrderGoodsServiceImpl implements OrderGoodsService {

	private OrderGoodsDAO orderGoodsDAO;

	public void setOrderGoodsDAO(OrderGoodsDAO orderGoodsDAO) {
		this.orderGoodsDAO = orderGoodsDAO;
	}

	@Override
	public Map<String, Object> getOrderGoods(Criteria cri) throws SQLException {
		Map<String, Object> dataMap = new HashMap<String, Object>();

		List<LaundryArticlesVO> orderGoodsList = orderGoodsDAO.orderGoods(cri);

		// 전체 board 개수
		int totalCount = orderGoodsDAO.selectOrderGoodsCriteriaTotalCount(cri);
		// PageMaker 생성.
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(totalCount);

		dataMap.put("orderGoodsList", orderGoodsList);
		dataMap.put("pageMaker", pageMaker);

		return dataMap;
	}

	@Override
	public LaundryArticlesVO getOrderGoods(String articlesCode) throws SQLException {

		LaundryArticlesVO ordergoods = orderGoodsDAO.selectOrderGoodsByArticlesCode(articlesCode);
		return ordergoods;
	}

	@Override
	public void regist(LaundryArticlesVO ordergoods) throws SQLException {
		orderGoodsDAO.insertOrderGoods(ordergoods);
	}

	@Override
	public void modify(LaundryArticlesVO ordergoods) throws SQLException {
		orderGoodsDAO.updateOrderGoods(ordergoods);
		orderGoodsDAO.selectOrderGoodsByPicture(ordergoods.getPicture());
	}

	@Override
	public void remove(String articlesCode) throws SQLException {
		orderGoodsDAO.deleteOrderGoods(articlesCode);
	}
}
