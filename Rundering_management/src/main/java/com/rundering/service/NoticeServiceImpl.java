package com.rundering.service;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.jsp.command.Criteria;
import com.jsp.command.PageMaker;
import com.rundering.dao.NoticeDAO;
import com.rundering.dto.NoticeVO;


public class NoticeServiceImpl implements NoticeService{
	
	private NoticeDAO noticeDAO;
	public void setNoticeDAO(NoticeDAO noticeDAO) {
		this.noticeDAO = noticeDAO;
	}

	@Override
	public Map<String, Object> getNoticeList() throws SQLException {

			Map<String, Object> dataMap = new HashMap<String, Object>();

			// 현재 page 번호에 맞는 리스트를 perPageNum 개수 만큼 가져오기.
			List<NoticeVO> noticeList = noticeDAO.selectNoticeList();

			dataMap.put("noticeList", noticeList);

			return dataMap;
		
	}

	@Override
	public NoticeVO getNotice(int noticeno) throws SQLException {
			NoticeVO notice = noticeDAO.selectNoticeByNno( noticeno);
			//noticeDAO.increaseViewCount(noticeno);
			return notice;
	}

	@Override
	public NoticeVO getNoticeForModify(int noticeno) throws SQLException {
			NoticeVO board = noticeDAO.selectNoticeByNno(noticeno);
			return board;
	}

	@Override
	public void regist(NoticeVO notice) throws SQLException {
			int noticeno = noticeDAO.selectNoticeSequenceNextValue();
			notice.setNoticeno(noticeno);
			noticeDAO.insertNotice(notice);
	}
	@Override
	public void modify(NoticeVO notice) throws SQLException {
			noticeDAO.updateNotice(notice);
	}

	@Override
	public void remove(int noticeno) throws SQLException {
			noticeDAO.deleteNotice( noticeno);
	}
	

}
