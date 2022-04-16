package com.rundering.service;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.rundering.manage.Criteria;
import com.rundering.manage.PageMaker;

import oracle.jdbc.oracore.OracleTypeDATE;

import com.rundering.dao.AttachDAO;
import com.rundering.dao.LaundryArticlesDAO;
import com.rundering.dto.AttachVO;
import com.rundering.dto.LaundryArticlesVO;

public class LaundryArticlesServiceImpl implements LaundryArticlesService {

	private LaundryArticlesDAO laundryArticlesDAO;
	private AttachDAO attachDAO;

	public void setLaundryArticlesDAO(LaundryArticlesDAO laundryArticlesDAO) {
		this.laundryArticlesDAO = laundryArticlesDAO;
	}
	public void setAttachDAO(AttachDAO attachDAO) {
		this.attachDAO = attachDAO;
	}

	@Override
	public Map<String, Object> getLaundryArticles(Criteria cri) throws SQLException {
		Map<String, Object> dataMap = new HashMap<String, Object>();

		List<LaundryArticlesVO> laundryArticlesList = laundryArticlesDAO.LaundryArticlesList(cri);

		// 전체 board 개수
		int totalCount = laundryArticlesDAO.selectLaundryArticlesCriteriaTotalCount(cri);
		// PageMaker 생성.
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(totalCount);

		dataMap.put("laundryArticlesList", laundryArticlesList);
		dataMap.put("pageMaker", pageMaker);

		return dataMap;
	}

	@Override
	public void regist(LaundryArticlesVO laundryArticles,AttachVO attach) throws Exception {
		int seq=attachDAO.selectFileNo();
		String strSeq = Integer.toString(seq);
		attach.setAtchFileNo(strSeq);
		laundryArticles.setAtchFileNo(strSeq);
		attachDAO.insertOrderGoodsAtach(attach);
		laundryArticlesDAO.insertLaundryArticles(laundryArticles);
	}

	@Override
	public Map<String, Object> getLaundryArticles(String articlesCode, AttachVO attach) throws SQLException {
		
		Map<String, Object> dataMap = new HashMap<String, Object>();
		
		LaundryArticlesVO laundryArticles = laundryArticlesDAO.selectLaundryArticlesListByArticlesCode(articlesCode);
	//	AttachVO attachName = attachDAO.
		
		dataMap.put("laudnryArticles", laundryArticles);
		dataMap.put("attachName", "attachName");
		
		return dataMap;
	}


	@Override
	public void modify(LaundryArticlesVO laundryArticles) throws SQLException {
		
		laundryArticlesDAO.updateLaundryArticles(laundryArticles);
	}

	@Override
	public void remove(String articlesCode) throws SQLException {
		laundryArticlesDAO.deleteLaundryArticles(articlesCode);
		
	}
}
