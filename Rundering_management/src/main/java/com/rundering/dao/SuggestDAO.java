package com.rundering.dao;

import java.sql.SQLException;
import java.util.List;

import com.rundering.command.CustomerListCriteria;
import com.rundering.dto.SuggestVO;

public interface SuggestDAO {

	List<SuggestVO> selectSearchSuggestList(CustomerListCriteria cri) throws SQLException;

	int selectSearchSuggestListCount(CustomerListCriteria cri) throws SQLException;

	SuggestVO selectSuggestBySno(int sno) throws SQLException;

	void increaseViewCount(int sno) throws SQLException;
	
	void checkSuggest(int sno) throws SQLException;

	int selectSuggestSequenceNextValue() throws SQLException;

	void insertSuggest(SuggestVO Suggest) throws SQLException;

	void updateSuggest(SuggestVO Suggest) throws SQLException;

	void deleteSuggest(int sno) throws SQLException;
}
