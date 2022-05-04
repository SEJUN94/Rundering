package com.rundering.service;

import java.util.HashMap;
import java.util.Map;

import com.rundering.dao.BranchApplicationDAO;
import com.rundering.dto.BranchApplicationVO;

public class BranchApplicationServiceImpl implements BranchApplicationService {

	private BranchApplicationDAO branchApplicationDAO;

	public void setBranchApplicationDAO(BranchApplicationDAO branchApplicationDAO) {
		this.branchApplicationDAO = branchApplicationDAO;
	}

	// 지점 신청
	@Override
	public void branchApplicate(BranchApplicationVO bv) throws Exception {
		branchApplicationDAO.branchApplicate(bv);

	}
	
	
	// 지점 신청 확인 들어가기전 본인인증
	@Override
	public BranchApplicationVO getSelfAuthentification(BranchApplicationVO bv) throws Exception {
		return branchApplicationDAO.selectSelfAuthentification(bv);
	}
	
	//지점 신청 심사내역
	@Override
	public void updateJudge(BranchApplicationVO bv) throws Exception {
		branchApplicationDAO.updateJudge(bv);
		
	}

	@Override
	public Map<String, Object> getSelfAuthentification(BranchApplicationVO bv) throws Exception {
		Map<String, Object> dataMap = new HashMap<String, Object>();
		String ok = "OK";
		String no = "NO";
		BranchApplicationVO branchApplication = branchApplicationDAO.selectSelfAuthentification(bv);
		
		if(branchApplication.getPhone() != null || branchApplication.getPhone().isEmpty()) {

			dataMap.put("NO", no);
		 
		}else {
			
			dataMap.put("branchApplication",branchApplication);
			dataMap.put("OK", ok);
			
		}
		
		
		
		return dataMap;
	}
	

}
