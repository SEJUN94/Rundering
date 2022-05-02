package com.rundering.dao;

import com.rundering.dto.BranchApplicationVO;

public interface BranchApplicationDAO {
	
	// 지점신청
	public void  branchApplicate(BranchApplicationVO bv) throws Exception;
	
}
