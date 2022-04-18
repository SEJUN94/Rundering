package com.rundering.service;

import java.sql.SQLException;
import java.util.Map;

import com.rundering.manage.Criteria;
import com.rundering.dto.NoticeVO;

public interface NoticeService {

	// 목록조회
	public Map<String, Object> getNoticeList(Criteria cri) throws SQLException;
	
	// 상세보기
	NoticeVO getNotice(int noticeno) throws SQLException;
	
	// 수정화면 상세
	NoticeVO getNoticeForModify(int noticeno) throws SQLException;

	// 등록
	void regist(NoticeVO notice)throws SQLException;
	
	// 수정
	void modify(NoticeVO notice) throws SQLException;

	// 삭제
	void remove(int noticeno) throws SQLException;
	

}