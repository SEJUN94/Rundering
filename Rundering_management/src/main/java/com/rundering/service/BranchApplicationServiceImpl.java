package com.rundering.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.fasterxml.jackson.annotation.JacksonInject.Value;
import com.rundering.command.Criteria;
import com.rundering.command.PageMaker;
import com.rundering.dao.BranchApplicationDAO;
import com.rundering.dto.BranchApplicationVO;
import com.rundering.dto.EmployeesVO;

public class BranchApplicationServiceImpl implements BranchApplicationService{

	BranchApplicationDAO branchApplicationDAO;
	
	public void setBranchApplicationDAO(BranchApplicationDAO branchApplicationDAO) {
		this.branchApplicationDAO = branchApplicationDAO;
	}
	
	@Override
	public Map<String, Object> selectBranchApplicationList(Criteria cri) throws Exception {
		Map<String, Object> dataMap = new HashMap<String, Object>();
		
		List<BranchApplicationVO>branchApplicationList = branchApplicationDAO.selectBranchApplication(cri);
				
		int count = branchApplicationDAO.selectBranchApplicationCount(cri);

		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(count);
		
		
		dataMap.put("branchApplicationList", branchApplicationList);
		dataMap.put("pageMaker", pageMaker);

		return dataMap;
	}
	@Override
	public BranchApplicationVO selectBranchApplication(String applicationNo) throws Exception{
		return branchApplicationDAO.selectBranchApplicationByapplicationNo(applicationNo);
	}
	 
	@Override
	public void updateRejectContent(BranchApplicationVO branchApplication) throws Exception{
		branchApplicationDAO.updateApprovalreturnContentsByBranchApplicationVO(branchApplication);
	}
	@Override
	public void updateApproval(BranchApplicationVO branchApplication) throws Exception{
		branchApplicationDAO.updateApprovalreturnYByBranchApplicationVO(branchApplication);
	}

	@Override
	public void updateExamination(BranchApplicationVO branchApplication,EmployeesVO emp) throws Exception {
		branchApplicationDAO.updateExaminationByBranchApplicationVO(branchApplication);
		
	}
	@Override
	public void updateVoluntaryCheck(BranchApplicationVO branchApplication) throws Exception{
		branchApplicationDAO.updateProgressStatusCode08ByBranchApplicationVO(branchApplication);
	}

}
