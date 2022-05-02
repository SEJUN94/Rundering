package com.rundering.service;

import java.util.Map;

import com.rundering.dto.BranchApplicationVO;

public interface BranchApplicationService {
	
	// 지점신청
	void  branchApplicate(BranchApplicationVO bv) throws Exception;
	
	Map<String, Object>  getSelfAuthentification(BranchApplicationVO bv) throws Exception;
	
}
