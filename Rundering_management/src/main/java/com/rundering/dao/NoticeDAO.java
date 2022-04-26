package com.rundering.dao;

import java.sql.SQLException;
import java.util.List;

import com.rundering.command.CustomerListCriteria;
import com.rundering.dto.NoticeVO;

public interface NoticeDAO {
	
	List<NoticeVO> selectNoticeList(CustomerListCriteria cri) throws SQLException;
	
	int selectSearchNoticeListCount(CustomerListCriteria cri) throws SQLException;
	
	NoticeVO selectNoticeByNno(  int nno) throws SQLException;
	
	NoticeVO selectNoticeByImage(String imageFile) throws SQLException;

	void increaseViewCount(  int nno) throws SQLException;
	
	int selectNoticeSequenceNextValue() throws SQLException;

	int selectReplySequenceNextValue() throws SQLException;
	
	void insertNotice(  NoticeVO notice) throws SQLException;
	
	void updateNotice(  NoticeVO notice) throws SQLException;
	
	void deleteNotice(  int nno) throws SQLException;
	
	

}
