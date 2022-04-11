package com.rundering.dao;

import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.jsp.command.Criteria;
import com.rundering.dto.NoticeVO;


public class NoticeDAOBeanImpl implements NoticeDAOBean {

	private SqlSession session;
	private NoticeDAOBean noticeDAOBean;
	
	
	public void setSession(SqlSession session) {
		this.session = session;
	}

	public void setNoticeDAO(NoticeDAOBean noticeDAOBean) {
		this.noticeDAOBean = noticeDAOBean;
	}

	@Override
	public List<NoticeVO> selectSearchNoticeList(SqlSession session, Criteria cri) throws SQLException {
		return noticeDAOBean.selectSearchNoticeList(session, cri);
	}

	@Override
	public int selectSearchNoticeListCount(SqlSession session, Criteria cri) throws SQLException {
		return noticeDAOBean.selectSearchNoticeListCount(session, cri);
	}

	@Override
	public NoticeVO selectNoticeByNno(SqlSession session, int nno) throws SQLException {
		return noticeDAOBean.selectNoticeByNno(session, nno);
	}

	@Override
	public void increaseViewCount(SqlSession session, int nno) throws SQLException {
		noticeDAOBean.increaseViewCount(session, nno);
	}

	@Override
	public int selectNoticeSequenceNextValue(SqlSession session) throws SQLException {
		return noticeDAOBean.selectNoticeSequenceNextValue(session);
	}

	@Override
	public void insertNotice(SqlSession session, NoticeVO Notice) throws SQLException {
		noticeDAOBean.insertNotice(session, Notice);
	}

	@Override
	public void updateNotice(SqlSession session, NoticeVO Notice) throws SQLException {
		noticeDAOBean.updateNotice(session, Notice);
	}

	@Override
	public void deleteNotice(SqlSession session, int nno) throws SQLException {
		noticeDAOBean.deleteNotice(session, nno);
	}

	@Override
	public NoticeVO selectNoticeByImage(SqlSession session, String imageFile) throws SQLException {
		NoticeVO notice 
			= session.selectOne("Notice-Mapper.selectNoticeByImage",imageFile);
		return notice;
	}

}
