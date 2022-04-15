package com.rundering.service;

import java.sql.SQLException;
import java.util.Map;

import com.rundering.manage.Criteria;
import com.rundering.dto.AttachVO;
import com.rundering.dto.LaundryArticlesVO;


public interface OrderGoodsService {
	public Map<String, Object> getOrderGoods(Criteria cri) throws SQLException;
	// 상세보기
	LaundryArticlesVO getOrderGoods(String articlesCode)throws SQLException;	
		
	// 등록
	void regist(LaundryArticlesVO ordergoods,AttachVO attach)throws Exception;
		
	// 수정
	void modify(LaundryArticlesVO ordergoods)throws SQLException;
	
	// 삭제
	void remove(String articlesCode)throws SQLException;
	
	
}
