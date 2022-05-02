package com.rundering.dao;

import java.util.List;

import com.rundering.command.Criteria;
import com.rundering.dto.BranchApplicationVO;

public interface BranchApplicationDAO {
	
	
	public BranchApplicationVO selectBranchApplicationByapplicationNo() throws Exception;

	List<BranchApplicationVO> selectBranchApplication(Criteria cri) throws Exception;
	
	public int selectBranchApplicationCount(Criteria cri) throws Exception;
	
	public void updateApprovalreturnContentsByBranchApplicationVO(BranchApplicationVO branchApplication) throws Exception;
	
	public void updateApprovalreturnYByBranchApplicationVO(BranchApplicationVO branchApplication) throws Exception;
}
