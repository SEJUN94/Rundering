package com.rundering.service;

import java.sql.SQLException;
import java.util.Map;

import com.rundering.dto.SuggestBoardVO;
import com.rundering.manage.Criteria;

public interface AnonymousService {

	// 목록조회
	public Map<String, Object> getAnonymousList(Criteria cri) throws SQLException;
	
	// 상세보기
	SuggestBoardVO getAnonymous(int ano) throws SQLException;

	// 수정화면 상세
	SuggestBoardVO getAnonymousModify(int ano) throws SQLException;

	// 등록
	void regist(SuggestBoardVO anonymous) throws SQLException;

	// 수정
	void modify(SuggestBoardVO anonymous) throws SQLException;

	// 삭제
	void remove(int ano) throws SQLException;

	

}
