package com.rundering.service;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.rundering.command.Criteria;
import com.rundering.command.PageMaker;
import com.rundering.dao.FAQDAO;
import com.rundering.dto.FAQVO;

public class FAQServiceImpl implements FAQService {
	
	private FAQDAO faqDAO;
	
	public void setFaqDAO(FAQDAO faqDAO) {
		this.faqDAO = faqDAO;
	}

	@Override
	public Map<String, Object> getFAQList(Criteria cri) throws SQLException {
		Map<String, Object> dataMap = new HashMap<String, Object>();

		// 현재 page 번호에 맞게 리스트를 가져오기
		List<FAQVO> faqList = faqDAO.selectSearchFAQList(cri);

		// 전체 board 개수
		int totalCount = faqDAO.selectSearchFAQListCount(cri);

		// PageMaker 생성.
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(totalCount);

		dataMap.put("faqList", faqList);
		dataMap.put("pageMaker", pageMaker);

		return dataMap;
	}
	
	@Override
	public FAQVO getFAQModify(int faqno) throws SQLException {
		FAQVO faq = faqDAO.selectFAQByFaqno(faqno);
		return faq;
	}
	
	@Override
	public void regist(FAQVO faq) throws SQLException {
		faqDAO.insertFAQ(faq);
	}
	
	@Override
	public void modify(FAQVO faq) throws SQLException {
		faqDAO.updateFAQ(faq);
	}
	
	@Override
	public void remove(int faqno) throws SQLException {
		faqDAO.deleteFAQ(faqno);
	}

	/* 아코디언 */
	
	@Override
	public Map<String, Object> getFAQFrequentlyList(Criteria cri) throws SQLException {
		Map<String, Object> dataMap = new HashMap<String, Object>();

		List<FAQVO> frequentlyList = faqDAO.selectSearchFAQList(cri);

		dataMap.put("frequentlyList", frequentlyList);

		return dataMap;
	}

}
