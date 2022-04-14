package com.rundering.dao;

import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.jsp.command.Criteria;
import com.rundering.dto.NoticeVO;


public class NoticeDAOImpl implements NoticeDAO {

	private SqlSession session;
	
	
	public void setSession(SqlSession session) {
		this.session = session;
	}


	@Override
	public List<NoticeVO> selectNoticeList() throws SQLException {
		List<NoticeVO> noticeList = session.selectList("Notice-Mapper.selectNoticeList");
		return noticeList;
	}


	@Override
	public int selectSearchNoticeListCount(Criteria cri) throws SQLException {
		int count = session.selectOne("ns.id", cri);
		return count;
	}


	@Override
	public NoticeVO selectNoticeByNno(int noticeno) throws SQLException {
		NoticeVO number = session.selectOne("Notice-Mapper.selectNoticeByNno", noticeno);
		return number;
	}


	@Override
	public NoticeVO selectNoticeByImage(String imageFile) throws SQLException {
		NoticeVO imagefile = session.selectOne("ns.id", imageFile);
		return imagefile;
	}


	@Override
	public void increaseViewCount(int nno) throws SQLException {
		session.selectOne("ns.id", nno);
	}


	@Override
	public int selectNoticeSequenceNextValue() throws SQLException {
		int seq_num=session.selectOne("Notice-Mapper.selectNoticeSequenceNextValue");
		return seq_num;
	}


	@Override
	public void insertNotice(NoticeVO notice) throws SQLException {
		session.update("Notice-Mapper.insertNotice", notice);
		
	}


	@Override
	public void updateNotice(NoticeVO notice) throws SQLException {
		session.update("Notice-Mapper.updateNotice", notice);
		
	}


	@Override
	public void deleteNotice(int noticeno) throws SQLException {
		session.update("Notice-Mapper.deleteNotice", noticeno);
		
	}

	


}
