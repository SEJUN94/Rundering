package com.rundering.service;

import com.rundering.dto.BranchApplicationVO;

public interface BranchApplicationService {
	
	// 지점신청
	void  branchApplicate(BranchApplicationVO bv) throws Exception;
	
}
