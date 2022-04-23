package com.rundering.service;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.rundering.manage.Criteria;
import com.rundering.manage.PageMaker;
import com.rundering.dao.NoticeDAO;
import com.rundering.dto.NoticeVO;


public class NoticeServiceImpl implements NoticeService{
	
	private NoticeDAO noticeDAO;
	public void setNoticeDAO(NoticeDAO noticeDAO) {
		this.noticeDAO = noticeDAO;
	}

	@Override
	public Map<String, Object> getNoticeList(Criteria cri) throws SQLException {

		Map<String, Object> dataMap = new HashMap<String, Object>();

		// 현재 page 번호에 맞는 리스트를 perPageNum 개수 만큼 가져오기.
		List<NoticeVO> noticeList = noticeDAO.selectNoticeList(cri);
		
		// 전체 board 개수
		int totalCount = noticeDAO.selectSearchNoticeListCount(cri);
		
		// PageMaker 생성.
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(totalCount);

		dataMap.put("noticeList", noticeList);
		dataMap.put("pageMaker", pageMaker);

		return dataMap;

		
	}

	@Override
	public NoticeVO getNotice(int noticeno) throws SQLException {
			noticeDAO.increaseViewCount(noticeno);
			NoticeVO notice = noticeDAO.selectNoticeByNno( noticeno);
			return notice;
	}

	@Override
	public NoticeVO getNoticeForModify(int noticeno) throws SQLException {
			NoticeVO board = noticeDAO.selectNoticeByNno(noticeno);
			return board;
	}

	@Override
	public void regist(NoticeVO notice) throws SQLException {
		  	int replyno = noticeDAO.selectNoticeSequenceNextValue();
			int noticeno = noticeDAO.selectNoticeSequenceNextValue();
			notice.setReplyNo(replyno);
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
