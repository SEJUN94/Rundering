package com.rundering.dao;

import java.sql.SQLException;
import java.util.List;

import com.rundering.command.CustomerListCriteria;
import com.rundering.dto.LaundryArticlesVO;

public interface LaundryArticlesDAO {
	List<LaundryArticlesVO> LaundryArticlesList(CustomerListCriteria cri) throws SQLException;
	
	int selectLaundryArticlesCriteriaTotalCount(CustomerListCriteria cri) throws SQLException;
	
	LaundryArticlesVO selectLaundryArticlesListByArticlesCode(String articlesCode) throws SQLException;

	void insertLaundryArticles(LaundryArticlesVO laundryArticles) throws SQLException;

	void updateLaundryArticles(LaundryArticlesVO laundryArticles) throws SQLException;

	void deleteLaundryArticles(String articlesCode) throws SQLException;
	
	List<LaundryArticlesVO>	NotALaundryArticlesList(CustomerListCriteria cri) throws SQLException;
	
}
