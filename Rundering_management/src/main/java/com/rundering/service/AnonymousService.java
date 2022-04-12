package com.rundering.service;

import java.sql.SQLException;
import java.util.Map;

import com.jsp.command.Criteria;
import com.rundering.dto.AnonymousVO;

public interface AnonymousService {

	// 목록조회
	Map<String, Object> getAnonymousList(Criteria cri) throws SQLException;

	// 상세보기
	AnonymousVO getAnonymous(int ano) throws SQLException;

	// 수정화면 상세
	AnonymousVO getAnonymousModify(int ano) throws SQLException;

	// 등록
	void regist(AnonymousVO anonymous) throws SQLException;

	// 수정
	void modify(AnonymousVO anonymous) throws SQLException;

	// 삭제
	void remove(int ano) throws SQLException;

}
