package com.rundering.service;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.rundering.command.Criteria;
import com.rundering.command.NoticeRegistCommand;
import com.rundering.command.PageMaker;
import com.rundering.dao.AttachDAO;
import com.rundering.dao.BranchDAO;
import com.rundering.dao.EmployeesDAO;
import com.rundering.dao.NoticeDAO;
import com.rundering.dao.NotificationDAO;
import com.rundering.dao.ReplyDAO;
import com.rundering.dto.AttachVO;
import com.rundering.dto.BranchVO;
import com.rundering.dto.EmployeesVO;
import com.rundering.dto.NoticeVO;
import com.rundering.dto.NotificationVO;
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
	private NotificationDAO notificationDAO;
	public void setNotificationDAO(NotificationDAO notificationDAO) {
		this.notificationDAO = notificationDAO;
	}
	private AttachDAO attachDAO;
	public void setAttachDAO(AttachDAO attachDAO) {
		this.attachDAO = attachDAO;
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
	public Map<String, Object> getNotice(int noticeno) throws Exception {
			Map<String, Object> dataMap = new HashMap<String, Object>();
			noticeDAO.increaseViewCount(noticeno);
			NoticeVO notice = noticeDAO.selectNoticeByNno(noticeno);
			if(notice.getAtchFileNo() != null) {
				List<AttachVO> attachList = attachDAO.selectAttachVOByFileNo(notice.getAtchFileNo());
				dataMap.put("attachList", attachList);
			}
			
			dataMap.put("notice", notice);
			return dataMap;
	}

	@Override
	public Map<String, Object> getNoticeForModify(int noticeno) throws Exception {
			Map<String, Object> dataMap = new HashMap<String, Object>();
			NoticeVO notice = noticeDAO.selectNoticeByNno(noticeno);
			
			if(notice.getAtchFileNo() != null) {
				List<AttachVO> attachList = attachDAO.selectAttachVOByFileNo(notice.getAtchFileNo());
				dataMap.put("attachList", attachList);
			}
			
			dataMap.put("notice", notice);
			return dataMap;
	}

	@Override
	public void regist(NoticeRegistCommand notice, List<AttachVO> attachList) throws Exception {
		  	int replyno = noticeDAO.selectNoticeSequenceNextValue();
			int noticeno = noticeDAO.selectNoticeSequenceNextValue();
			
			NoticeVO noticeVO = notice.toNoticeVO();
			noticeVO.setReplyNo(replyno);
			noticeVO.setNoticeno(noticeno);
			
			if(attachList != null && attachList.size() > 0) {
				int atchFileNo = attachDAO.selectFileNo();

				for (AttachVO attach : attachList) {
					attach.setAtchFileNo(String.valueOf(atchFileNo));
					attachDAO.insertAttach(attach);
				}
				noticeVO.setAtchFileNo(String.valueOf(atchFileNo));
			}
			
			noticeDAO.insertNotice(noticeVO);
			
			//모든 지점의 사원에게 공지 알림 - 배송사원 제외
			List<BranchVO> branchList = branchDAO.selectBranchList();
			for (BranchVO branchVO : branchList) {
				if (branchVO.getBranchCode().equals("000000"))
					continue;
				List<EmployeesVO> employeesList = employeesDAO.selectEmployeesByBranchCode(branchVO.getBranchCode());
				NotificationVO notificationVO = new NotificationVO();
				for (EmployeesVO employeesVO : employeesList) {
					if (employeesVO.getDepartment().equals("DE"))
						continue;
					int sequence = notificationDAO.selectNotificationSequenceNextValue();
					notificationVO.setNtcnId(String.valueOf(sequence));
					notificationVO.setEmployeeId(employeesVO.getEmployeeId());
					notificationVO.setNtcnknd("NT"); // 알림종류 공통코드 - 공지사항
					notificationVO.setNtcncn(notice.getTitle());
					notificationVO.setNtcnclickhourUrl("'/runderingmanage/branch/notice/list','B040000'");
					notificationDAO.insertNotification(notificationVO);
				}

			}
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
