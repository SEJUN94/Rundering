package com.rundering.dao;

import java.sql.SQLException;
import java.util.List;

import com.rundering.command.Criteria;
import com.rundering.dto.FAQVO;

public interface FAQDAO {

	List<FAQVO> selectSearchFAQList(Criteria cri) throws SQLException;

	int selectSearchFAQListCount(Criteria cri) throws SQLException;
	
	int selectFAQSequenceNextValue() throws SQLException;
	
	FAQVO selectFAQByFaqno(int faqno) throws SQLException;
	
	void replyFAQ(FAQVO FAQ) throws SQLException;
	
	/* 아코디언 */
	List<FAQVO> selectFrequentlyList(Criteria cri) throws SQLException;
	
	void updateFrequently(FAQVO FAQ) throws SQLException;
	
	void deleteFrequently(int faqno) throws SQLException;
}
