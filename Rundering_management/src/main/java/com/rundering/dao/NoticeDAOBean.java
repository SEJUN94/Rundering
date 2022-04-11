package com.rundering.dao;

import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.jsp.command.Criteria;
import com.rundering.dto.NoticeVO;

public interface NoticeDAOBean {
	List<NoticeVO> selectSearchNoticeList(SqlSession session,Criteria cri) throws SQLException;
	
	int selectSearchNoticeListCount(SqlSession session, Criteria cri) throws SQLException;
	
	NoticeVO selectNoticeByNno(SqlSession session, int nno) throws SQLException;
	NoticeVO selectNoticeByImage(SqlSession session, String imageFile) throws SQLException;

	void increaseViewCount(SqlSession session, int nno) throws SQLException;
	
	int selectNoticeSequenceNextValue(SqlSession session) throws SQLException;
	
	void insertNotice(SqlSession session, NoticeVO Notice) throws SQLException;
	
	void updateNotice(SqlSession session, NoticeVO Notice) throws SQLException;
	
	void deleteNotice(SqlSession session, int nno) throws SQLException;
}
