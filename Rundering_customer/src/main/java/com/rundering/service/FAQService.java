package com.rundering.service;

import java.sql.SQLException;
import java.util.Map;

import com.rundering.command.MyOrderCriteria;
import com.rundering.dto.FAQVO;

public interface FAQService {
	
	// 목록조회
	public Map<String, Object> getFAQList(MyOrderCriteria cri) throws SQLException;

	// 등록
	void regist(FAQVO faq) throws SQLException;
	
	// 수정화면 상세
	FAQVO getFAQModify(int faqno) throws SQLException;
	
	// 수정
	void modify(FAQVO faq) throws SQLException;
	
	// 삭제
	void remove(int faqno) throws SQLException;
	
	/* 아코디언 */
	public Map<String, Object> getFAQFrequentlyList(MyOrderCriteria cri) throws SQLException;
}
