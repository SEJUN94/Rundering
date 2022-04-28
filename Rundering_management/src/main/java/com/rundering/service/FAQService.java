package com.rundering.service;

import java.sql.SQLException;
import java.util.Map;

import com.rundering.command.Criteria;
import com.rundering.dto.FAQVO;

public interface FAQService {
	
	// 목록조회
	public Map<String, Object> getFAQList(Criteria cri) throws SQLException;
	
	// 답글화면 상세
	FAQVO getFAQReply(int faqno) throws SQLException;
	
	// 답글
	void reply(FAQVO faq) throws SQLException;
	
}
