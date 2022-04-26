package com.rundering.service;

import java.sql.SQLException;
import java.util.Map;

import com.rundering.command.CustomerListCriteria;
import com.rundering.dto.SuggestVO;

public interface SuggestService {

	// 목록조회
	public Map<String, Object> getSuggestList(CustomerListCriteria cri) throws SQLException;

	// 상세보기
	SuggestVO getSuggest(int sno) throws SQLException;
	
	// 확인미확인
	SuggestVO getCheck(int sno) throws SQLException;

	// 수정화면 상세
	SuggestVO getSuggestModify(int sno) throws SQLException;

	// 등록
	void regist(SuggestVO suggest) throws SQLException;

	// 수정
	void modify(SuggestVO suggest) throws SQLException;

	// 삭제
	void remove(int sno) throws SQLException;

}
