package com.rundering.service;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.rundering.command.Criteria;
import com.rundering.command.PageMaker;
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

		List<LaundryArticlesVO> laundryArticlesList = laundryArticlesDAO.NotALaundryArticlesList(cri);

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
	public LaundryArticlesVO getLaundryArticles(String articlesCode) throws SQLException {
		LaundryArticlesVO laundryArticles = laundryArticlesDAO.selectLaundryArticlesListByArticlesCode(articlesCode);
		
		return laundryArticles;
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
