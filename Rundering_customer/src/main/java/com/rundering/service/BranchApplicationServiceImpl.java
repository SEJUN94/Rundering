package com.rundering.service;

import com.rundering.dao.BranchApplicationDAO;
import com.rundering.dto.BranchApplicationVO;

public class BranchApplicationServiceImpl implements BranchApplicationService {
	
	private  BranchApplicationDAO branchApplicationDAO;
	
	public void setBranchApplicationDAO(BranchApplicationDAO branchApplicationDAO) {
		this.branchApplicationDAO = branchApplicationDAO;
	}

	// 지점 신청
	@Override
	public void branchApplicate(BranchApplicationVO bv) throws Exception {
		branchApplicationDAO.branchApplicate(bv);
		
	}
	

}
