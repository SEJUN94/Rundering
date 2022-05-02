package com.rundering.service;

import java.util.Map;

import com.rundering.command.Criteria;
import com.rundering.dto.BranchApplicationVO;

public interface BranchApplicationService { 
	public Map<String, Object> selectBranchApplicationList(Criteria cri) throws Exception;
	
	public void updateRejectContent(BranchApplicationVO branchApplication) throws Exception;

	void updateApproval(BranchApplicationVO branchApplication) throws Exception;
		
	
} 
