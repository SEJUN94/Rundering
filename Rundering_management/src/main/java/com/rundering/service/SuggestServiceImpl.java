package com.rundering.service;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.rundering.command.Criteria;
import com.rundering.command.PageMaker;
import com.rundering.dao.BranchDAO;
import com.rundering.dao.EmployeesDAO;
import com.rundering.dao.NotificationDAO;
import com.rundering.dao.SuggestDAO;
import com.rundering.dto.BranchVO;
import com.rundering.dto.EmployeesVO;
import com.rundering.dto.NotificationVO;
import com.rundering.dto.SuggestVO;

public class SuggestServiceImpl implements SuggestService {

	private SuggestDAO suggestDAO;

	public void setSuggestDAO(SuggestDAO suggestDAO) {
		this.suggestDAO = suggestDAO;
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
	public Map<String, Object> getSuggestList(Criteria cri) throws SQLException {

		Map<String, Object> dataMap = new HashMap<String, Object>();

		// 현재 page 번호에 맞게 리스트를 가져오기
		List<SuggestVO> suggestList = suggestDAO.selectSearchSuggestList(cri);

		// 전체 board 개수
		int totalCount = suggestDAO.selectSearchSuggestListCount(cri);

		// PageMaker 생성.
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(totalCount);

		dataMap.put("suggestList", suggestList);
		dataMap.put("pageMaker", pageMaker);

		return dataMap;
	}

	@Override
	public SuggestVO getSuggest(int sno) throws SQLException {
		suggestDAO.increaseViewCount(sno);

		SuggestVO suggest = suggestDAO.selectSuggestBySno(sno);
		return suggest;
	}

	@Override
	public SuggestVO getCheck(int sno) throws SQLException {
		suggestDAO.checkSuggest(sno);
		
		SuggestVO suggest = suggestDAO.selectSuggestBySno(sno);
		return suggest;
	}

	@Override
	public SuggestVO getSuggestModify(int sno) throws SQLException {
		SuggestVO suggest = suggestDAO.selectSuggestBySno(sno);
		return suggest;
	}

	@Override
	public void regist(SuggestVO suggest) throws Exception {
		suggestDAO.insertSuggest(suggest);
		//본사 직원들에게 알림
		BranchVO branchVO = branchDAO.selectBranchByBranchCode("000000");
		List<EmployeesVO> employeesList = employeesDAO.selectEmployeesByBranchCode(branchVO.getBranchCode());
		NotificationVO notificationVO = new NotificationVO();
			for (EmployeesVO employeesVO : employeesList) {
				int sequence = notificationDAO.selectNotificationSequenceNextValue();
				notificationVO.setNtcnId(String.valueOf(sequence));
				notificationVO.setEmployeeId(employeesVO.getEmployeeId());
				notificationVO.setNtcnknd("SG"); // 알림종류 공통코드 - 건의사항
				notificationVO.setNtcncn(branchDAO.getBranchByCode(suggest.getBranchName()).getBranchName());
				notificationVO.setNtcnclickhourUrl("'/runderingmanage/admin/suggest/list','A050200'");
				notificationDAO.insertNotification(notificationVO);
			}
	}

	@Override
	public void modify(SuggestVO suggest) throws SQLException {
		suggestDAO.updateSuggest(suggest);
	}

	@Override
	public void remove(int sno) throws SQLException {
		suggestDAO.deleteSuggest(sno);
	}
}
