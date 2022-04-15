package com.rundering.service;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.rundering.manage.Criteria;
import com.rundering.manage.PageMaker;

import oracle.jdbc.oracore.OracleTypeDATE;

import com.rundering.dao.AttachDAO;
import com.rundering.dao.OrderGoodsDAO;
import com.rundering.dto.AttachVO;
import com.rundering.dto.LaundryArticlesVO;

public class OrderGoodsServiceImpl implements OrderGoodsService {

	private OrderGoodsDAO orderGoodsDAO;
	private AttachDAO attachDAO;

	public void setOrderGoodsDAO(OrderGoodsDAO orderGoodsDAO) {
		this.orderGoodsDAO = orderGoodsDAO;
	}
	public void setAttachDAO(AttachDAO attachDAO) {
		this.attachDAO = attachDAO;
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
	public void regist(LaundryArticlesVO ordergoods,AttachVO attach) throws Exception {
		int seq=attachDAO.selectFileNo();
		String strSeq = Integer.toString(seq);
		attach.setAtchFileNo(strSeq);
		ordergoods.setAtchFileNo(strSeq);
		attachDAO.insertOrderGoodsAtach(attach);
		orderGoodsDAO.insertOrderGoods(ordergoods);
	}

	@Override
	public LaundryArticlesVO getOrderGoods(String articlesCode) throws SQLException {
		
		LaundryArticlesVO ordergoods = orderGoodsDAO.selectOrderGoodsByArticlesCode(articlesCode);
		
		return ordergoods;
	}


	@Override
	public void modify(LaundryArticlesVO ordergoods) throws SQLException {
		orderGoodsDAO.updateOrderGoods(ordergoods);
	}

	@Override
	public void remove(String articlesCode) throws SQLException {
		orderGoodsDAO.deleteOrderGoods(articlesCode);
		
	}
}
