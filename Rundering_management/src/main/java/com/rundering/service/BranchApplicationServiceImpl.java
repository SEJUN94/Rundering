package com.rundering.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.fasterxml.jackson.annotation.JacksonInject.Value;
import com.rundering.command.Criteria;
import com.rundering.command.PageMaker;
import com.rundering.dao.BranchApplicationDAO;
import com.rundering.dao.BranchDAO;
import com.rundering.dao.LaundryFixturesDAO;
import com.rundering.dao.MemberDAO;
import com.rundering.dto.BranchApplicationVO;
import com.rundering.dto.BranchVO;
import com.rundering.dto.EmployeesVO;
import com.rundering.dto.LaundryFixturesVO;
import com.rundering.dto.MemberVO;

public class BranchApplicationServiceImpl implements BranchApplicationService{

	BranchApplicationDAO branchApplicationDAO;
	BranchDAO branchDAO;
	MemberDAO memberDAO;
	LaundryFixturesDAO laundryFixturesDAO;
	
	public void setBranchApplicationDAO(BranchApplicationDAO branchApplicationDAO) {
		this.branchApplicationDAO = branchApplicationDAO;
	}
	public void setBranchDAO(BranchDAO branchDAO) {
		this.branchDAO = branchDAO;
	}
	public void setMemberDAO(MemberDAO memberDAO) {
		this.memberDAO = memberDAO;
	}
	public void setLaundryFixturesDAO(LaundryFixturesDAO laundryFixturesDAO) {
		this.laundryFixturesDAO = laundryFixturesDAO;
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
	@Override
	public String selectBranchCode(String area) throws Exception{
		String maxBranchCode = branchDAO.selectBranchCodeByArea(area);
		if(maxBranchCode==null) {
			return area+"01";
		}
		int branchCode = Integer.parseInt(maxBranchCode)+1;
		String result = ""+branchCode;
		if(branchCode<100000) {
			result="0"+branchCode;
		}
	
		return result;
	}
	@Override
	public void enrollmentRegist(MemberVO member,BranchVO branch,List<LaundryFixturesVO> laundryFixturesVOList,String applicationNo) {
		try {
			memberDAO.insertBranchMemberByMemberVO(member);
	
			branchDAO.insertBranch(branch);
			for (LaundryFixturesVO laundryFixtures : laundryFixturesVOList) {
				laundryFixturesDAO.insertFixturesByFixtrues(laundryFixtures);
			}
			BranchApplicationVO branchApplication = new BranchApplicationVO();
			branchApplication.setApplicationNo(Integer.parseInt(applicationNo));
			branchApplicationDAO.updateProgressStatusCode10ByBranchApplicationVO(branchApplication);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}

}
