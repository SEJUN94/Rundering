package com.rundering.dao;

import java.sql.SQLException;
import java.util.List;

import com.rundering.command.Criteria;
import com.rundering.dto.FAQVO;

public interface FAQDAO {

	/* 일반 문의 */
	List<FAQVO> selectSearchFAQList(Criteria cri) throws SQLException;

	int selectSearchFAQListCount(Criteria cri) throws SQLException;
	
	int selectFAQSequenceNextValue() throws SQLException;
	
	void insertFAQ(FAQVO FAQ) throws SQLException;
	
	FAQVO selectFAQByFaqno(int faqno) throws SQLException;
	
	void updateFAQ(FAQVO FAQ) throws SQLException;
	
	void deleteFAQ(int faqno) throws SQLException;
	
	/* 아코디언 */
	List<FAQVO> selectFrequentlyList(Criteria cri) throws SQLException;
}
