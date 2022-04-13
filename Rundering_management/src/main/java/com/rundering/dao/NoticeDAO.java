package com.rundering.dao;

import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.jsp.command.Criteria;
import com.rundering.dto.NoticeVO;

public interface NoticeDAO {
	
	List<NoticeVO> selectNoticeList() throws SQLException;
	
	
	int selectSearchNoticeListCount(Criteria cri) throws SQLException;
	
	NoticeVO selectNoticeByNno(  int nno) throws SQLException;
	
	NoticeVO selectNoticeByImage(String imageFile) throws SQLException;

	void increaseViewCount(  int nno) throws SQLException;
	
	int selectNoticeSequenceNextValue() throws SQLException;
	
	void insertNotice(  NoticeVO notice) throws SQLException;
	
	void updateNotice(  NoticeVO notice) throws SQLException;
	
	void deleteNotice(  int nno) throws SQLException;
	
	

}
