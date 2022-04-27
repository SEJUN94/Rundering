package com.rundering.service;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;

import com.rundering.command.Criteria;
import com.rundering.command.PageMaker;
import com.rundering.dao.BranchDAO;
import com.rundering.dao.EmployeesDAO;
import com.rundering.dao.NoticeDAO;
import com.rundering.dao.ReplyDAO;
import com.rundering.dto.BranchVO;
import com.rundering.dto.EmployeesVO;
import com.rundering.dto.MemberVO;
import com.rundering.dto.NoticeVO;
import com.rundering.dto.ReplyVO;


public class NoticeServiceImpl implements NoticeService{
	
	private NoticeDAO noticeDAO;
	public void setNoticeDAO(NoticeDAO noticeDAO) {
		this.noticeDAO = noticeDAO;
	}
	private ReplyDAO replyDAO;
	public void setReplyDAO(ReplyDAO replyDAO) {
		this.replyDAO = replyDAO;
	}
	private EmployeesDAO employeesDAO;
	public void setEmployeesDAO(EmployeesDAO employeesDAO) {
		this.employeesDAO = employeesDAO;
	}
	private BranchDAO branchDAO;
	public void setBranchDAO(BranchDAO branchDAO) {
		this.branchDAO = branchDAO;
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
	
	// 댓글 목록 출력
	@Override
	public Map<String, Object> getNoticeReplyList(String replyno, Criteria cri) throws Exception{
		Map<String, Object> dataMap = new HashMap<String, Object>();
		
		Map<String, String> employeeIdMap = new HashMap<String, String>();
		Map<String,String> branchMap = new HashMap<String, String>();
		List<ReplyVO> replyList = replyDAO.selectReplyByReplyNo(Integer.parseInt(replyno),cri);
		for (ReplyVO reply : replyList) {
			EmployeesVO employee= employeesDAO.getEmployeeByNo(reply.getMemberno());
			BranchVO branch =  branchDAO.selectBranchByBranchCode(employee.getBranchCode());
			
			employeeIdMap.put(reply.getMemberno(), employee.getEmployeeId());
			branchMap.put(employee.getEmployeeId(), branch.getBranchName());
		}
		
		
		
		int count = replyDAO.selectReplyCountByReplyno(Integer.parseInt(replyno));

		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(count);
		
		
		dataMap.put("employeeIdMap", employeeIdMap);
		dataMap.put("branchMap", branchMap);
		dataMap.put("replyList", replyList);
		dataMap.put("pageMaker", pageMaker);

		return dataMap;
		
		
	}
 	
	

}
