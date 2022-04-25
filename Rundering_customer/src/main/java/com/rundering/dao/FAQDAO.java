package com.rundering.dao;

import java.sql.SQLException;
import java.util.List;

import com.rundering.customer.Criteria;
import com.rundering.dto.FAQVO;

public interface FAQDAO {

	List<FAQVO> selectSearchFAQList(Criteria cri) throws SQLException;

	int selectSearchFAQListCount(Criteria cri) throws SQLException;
}
