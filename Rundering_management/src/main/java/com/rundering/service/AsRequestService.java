package com.rundering.service;

import java.sql.SQLException;
import java.util.Map;

import com.rundering.dto.AsRequestVO;
import com.rundering.manage.Criteria;

public interface AsRequestService {

	// 목록조회
	public Map<String, Object> getAsRequestList(Criteria cri) throws SQLException;

	// 상세보기
	/* AsRequestVO getAsRequest(int asno) throws SQLException; */

	// 확인미확인
	AsRequestVO getCheck(int asno) throws SQLException;

	// 수정화면 상세
	AsRequestVO getAsRequestModify(int asno) throws SQLException;

	// 등록
	void regist(AsRequestVO asrequest) throws SQLException;

	// 수정
	void modify(AsRequestVO asrequest) throws SQLException;

	// 삭제
	void remove(int asno) throws SQLException;

}