package com.rundering.service;

import java.sql.SQLException;
import java.util.List;

import com.rundering.dto.AnonymousBoardVO;

public interface AnonymousService {

	// 목록조회
	List<AnonymousBoardVO> getAnonymousList() throws SQLException;

	// 상세보기
	AnonymousBoardVO getAnonymous(int ano) throws SQLException;

	// 수정화면 상세
	AnonymousBoardVO getAnonymousModify(int ano) throws SQLException;

	// 등록
	void regist(AnonymousBoardVO anonymous) throws SQLException;

	// 수정
	void modify(AnonymousBoardVO anonymous) throws SQLException;

	// 삭제
	void remove(int ano) throws SQLException;

	

}
