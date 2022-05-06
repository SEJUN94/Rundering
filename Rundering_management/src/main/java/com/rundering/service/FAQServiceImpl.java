package com.rundering.service;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.rundering.command.AcoCriteria;
import com.rundering.command.AcoPageMaker;
import com.rundering.command.FAQCriteria;
import com.rundering.command.FAQPageMaker;
import com.rundering.dao.FAQDAO;
import com.rundering.dto.FAQVO;

public class FAQServiceImpl implements FAQService {
	
	private FAQDAO faqDAO;
	
	public void setFaqDAO(FAQDAO faqDAO) {
		this.faqDAO = faqDAO;
	}

	@Override
	public Map<String, Object> getFAQList(FAQCriteria cri) throws SQLException {
		Map<String, Object> dataMap = new HashMap<String, Object>();

		// 현재 page 번호에 맞게 리스트를 가져오기
		List<FAQVO> faqList = faqDAO.selectSearchFAQList(cri);

		// 전체 board 개수
		int totalCount = faqDAO.selectSearchFAQListCount(cri);

		// PageMaker 생성.
		FAQPageMaker pageMaker = new FAQPageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(totalCount);

		dataMap.put("faqList", faqList);
		dataMap.put("pageMaker", pageMaker);

		return dataMap;
	}
	
	@Override
	public FAQVO getFAQReply(int faqno) throws SQLException {
		FAQVO faq = faqDAO.selectFAQByFaqno(faqno);
		return faq;
	}
	
	@Override
	public void reply(FAQVO faq) throws SQLException {
		faqDAO.replyFAQ(faq);
	}
	
	/* 아코디언 */	
	@Override
	public Map<String, Object> getFAQFrequentlyList(AcoCriteria cri) throws SQLException {
		Map<String, Object> dataMap = new HashMap<String, Object>();
		
		// 현재 page 번호에 맞게 리스트를 가져오기
		List<FAQVO> frequentlyList = faqDAO.selectFrequentlyList(cri);
		
		// 전체 board 개수
		int totalCount = faqDAO.selectFrequentlyListCount(cri);
		
		// PageMaker 생성.
		AcoPageMaker pageMaker = new AcoPageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(totalCount);

		dataMap.put("frequentlyList", frequentlyList);
		dataMap.put("pageMaker", pageMaker);

		return dataMap;
	}

	
	@Override
	public void modify(FAQVO faq) throws SQLException {
		faqDAO.updateFrequently(faq);
	}

	@Override
	public void remove(int faqno) throws SQLException {
		faqDAO.deleteFrequently(faqno);
	}
	
	// 자주묻는질문 등록(아코디언)
	@Override
	public void insertQnA(FAQVO faq) throws Exception {
		faqDAO.insertQnA(faq);
	}
	
}
