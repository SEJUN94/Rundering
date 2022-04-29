package com.rundering.dao;

import java.sql.SQLException;
import java.util.List;

import com.rundering.command.FAQCriteria;
import com.rundering.command.AcoCriteria;
import com.rundering.dto.FAQVO;

public interface FAQDAO {

	List<FAQVO> selectSearchFAQList(FAQCriteria cri) throws SQLException;

	int selectSearchFAQListCount(FAQCriteria cri) throws SQLException;
	
	int selectFAQSequenceNextValue() throws SQLException;
	
	FAQVO selectFAQByFaqno(int faqno) throws SQLException;
	
	void replyFAQ(FAQVO FAQ) throws SQLException;
	
	/* 아코디언 */
	List<FAQVO> selectFrequentlyList(AcoCriteria cri) throws SQLException;
	
	int selectFrequentlyListCount(AcoCriteria cri) throws SQLException;
	
	void updateFrequently(FAQVO FAQ) throws SQLException;
	
	void deleteFrequently(int faqno) throws SQLException;
}
