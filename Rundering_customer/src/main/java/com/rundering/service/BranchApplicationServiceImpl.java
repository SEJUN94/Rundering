package com.rundering.service;

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


}
