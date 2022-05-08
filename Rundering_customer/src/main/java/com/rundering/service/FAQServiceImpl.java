package com.rundering.service;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.rundering.command.MyOrderCriteria;
import com.rundering.command.MyOrderPageMaker;
import com.rundering.dao.BranchDAO;
import com.rundering.dao.EmployeesDAO;
import com.rundering.dao.FAQDAO;
import com.rundering.dao.NotificationDAO;
import com.rundering.dto.BranchVO;
import com.rundering.dto.EmployeesVO;
import com.rundering.dto.FAQVO;
import com.rundering.dto.NotificationVO;

public class FAQServiceImpl implements FAQService {
	
	private FAQDAO faqDAO;
	
	public void setFaqDAO(FAQDAO faqDAO) {
		this.faqDAO = faqDAO;
	}
	private BranchDAO branchDAO;
	public void setBranchDAO(BranchDAO branchDAO) {
		this.branchDAO = branchDAO;
	}
	private EmployeesDAO employeesDAO;
	public void setEmployeesDAO(EmployeesDAO employeesDAO) {
		this.employeesDAO = employeesDAO;
	}
	private NotificationDAO notificationDAO;
	public void setNotificationDAO(NotificationDAO notificationDAO) {
		this.notificationDAO = notificationDAO;
	}

	@Override
	public Map<String, Object> getFAQList(MyOrderCriteria cri) throws SQLException {
		Map<String, Object> dataMap = new HashMap<String, Object>();

		// 현재 page 번호에 맞게 리스트를 가져오기
		List<FAQVO> faqList = faqDAO.selectSearchFAQList(cri);

		// 전체 board 개수
		int totalCount = faqDAO.selectSearchFAQListCount(cri);

		// PageMaker 생성.
		MyOrderPageMaker pageMaker = new MyOrderPageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(totalCount);

		dataMap.put("faqList", faqList);
		dataMap.put("pageMaker", pageMaker);

		return dataMap;
	}
	
	
	
	@Override
	public FAQVO getFAQModify(int faqno) throws SQLException {
		FAQVO faq = faqDAO.selectFAQByFaqno(faqno);
		return faq;
	}
	
	@Override
	public void regist(FAQVO faq) throws Exception {
		faqDAO.insertFAQ(faq);
		
		//본사 직원들에게 알림
		BranchVO branchVO = branchDAO.selectBranchByBranchCode("000000");
		List<EmployeesVO> employeesList = employeesDAO.selectEmployeesByBranchCode(branchVO.getBranchCode());
		NotificationVO notificationVO = new NotificationVO();
			for (EmployeesVO employeesVO : employeesList) {
				int sequence = notificationDAO.selectNotificationSequenceNextValue();
				notificationVO.setNtcnId(String.valueOf(sequence));
				notificationVO.setEmployeeId(employeesVO.getEmployeeId());
				notificationVO.setNtcnknd("IQ"); // 알림종류 공통코드 - 고객문의
				notificationVO.setNtcncn(faq.getQuestion());
				notificationVO.setNtcnclickhourUrl("'/runderingmanage/admin/question/list','A060200'");
				notificationDAO.insertNotification(notificationVO);
			}
	}
	
	@Override
	public void modify(FAQVO faq) throws SQLException {
		faqDAO.updateFAQ(faq);
	}
	
	@Override
	public void remove(int faqno) throws SQLException {
		faqDAO.deleteFAQ(faqno);
	}
	
	/* 주문번호 */
	@Override
	public Map<String, Object> getOrderList(MyOrderCriteria cri) throws SQLException {
		Map<String, Object> dataMap = new HashMap<String, Object>();

		List<FAQVO> orderList = faqDAO.selectOrderno(cri);

		dataMap.put("orderList", orderList);

		return dataMap;
	}

	/* 아코디언 */	
	@Override
	public Map<String, Object> getFAQFrequentlyList(MyOrderCriteria cri) throws SQLException {
		Map<String, Object> dataMap = new HashMap<String, Object>();
		
		// 현재 page 번호에 맞게 리스트를 가져오기
		List<FAQVO> frequentlyList = faqDAO.selectFrequentlyList(cri);
		
		// 전체 board 개수
		int totalCount = faqDAO.selectFrequentlyListCount(cri);
		
		// PageMaker 생성.
		MyOrderPageMaker pageMaker = new MyOrderPageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(totalCount);

		dataMap.put("frequentlyList", frequentlyList);
		dataMap.put("pageMaker", pageMaker);

		return dataMap;
	}

	// 내 문의내역
	@Override
	public Map<String, Object> getMyFAQList(MyOrderCriteria cri) throws SQLException {
		Map<String, Object> dataMap = new HashMap<String, Object>();

		// 현재 page 번호에 맞게 리스트를 가져오기
		List<FAQVO> faqList = faqDAO.MypageFAQList(cri);

		// 전체 board 개수
		int totalCount = faqDAO.MypageFAQListCount(cri);

		// PageMaker 생성.
		MyOrderPageMaker pageMaker = new MyOrderPageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(totalCount);

		dataMap.put("faqList", faqList);
		dataMap.put("pageMaker", pageMaker);

		return dataMap;
	}

}
