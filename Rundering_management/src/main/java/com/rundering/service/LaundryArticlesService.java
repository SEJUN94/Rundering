package com.rundering.service;

import java.sql.SQLException;
import java.util.Map;

import com.rundering.manage.Criteria;
import com.rundering.dto.AttachVO;
import com.rundering.dto.LaundryArticlesVO;


public interface LaundryArticlesService {
	public Map<String, Object> getLaundryArticles(Criteria cri) throws SQLException;
	// 상세보기
	public Map<String, Object> getLaundryArticles(String articlesCode, AttachVO attach)throws SQLException;	
		
	// 등록
	public void regist(LaundryArticlesVO laundryArticles,AttachVO attach)throws Exception;
		
	// 수정
	public void modify(LaundryArticlesVO laundryArticles)throws SQLException;
	
	// 삭제
	public void remove(String articlesCode)throws SQLException;
	
	
}
