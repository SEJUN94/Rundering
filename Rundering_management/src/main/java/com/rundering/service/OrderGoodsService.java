package com.rundering.service;

import java.sql.SQLException;
import java.util.Map;

import com.jsp.command.Criteria;
import com.rundering.dto.ArticlesLaundryVO;


public interface OrderGoodsService {
	public Map<String, Object> getOrderGoods(Criteria cri) throws SQLException;
	// 상세보기
	ArticlesLaundryVO getOrderGoods(String lndrwaterqlyCode)throws SQLException;	
		
	// 등록
	void regist(ArticlesLaundryVO ordergoods)throws SQLException;
		
	// 수정
	void modify(ArticlesLaundryVO ordergoods)throws SQLException;
	
	// 삭제
	void remove(String lndrwaterqlyCode)throws SQLException;
	
	
}
