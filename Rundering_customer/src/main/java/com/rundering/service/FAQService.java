package com.rundering.service;

import java.sql.SQLException;
import java.util.Map;

import com.rundering.customer.Criteria;
import com.rundering.dto.FAQVO;

public interface FAQService {
	
	// 목록조회
	public Map<String, Object> getFAQList(Criteria cri) throws SQLException;

	// 등록
	void regist(FAQVO faq) throws SQLException;
}
