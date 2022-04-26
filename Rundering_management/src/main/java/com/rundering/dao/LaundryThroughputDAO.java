package com.rundering.dao;

import java.util.List;

import com.rundering.command.BranchInfoDetailCommand;
import com.rundering.dto.BranchVO;
import com.rundering.dto.LaundryThroughPutVO;

public interface LaundryThroughputDAO {
	public List<LaundryThroughPutVO> throughputList() throws Exception;
	
	public LaundryThroughPutVO selectLaundryQuatoByThroughputNo(String throughputNo) throws Exception;
	
	public BranchInfoDetailCommand selectBranchDetail(String branchCode) throws Exception;
	
}
