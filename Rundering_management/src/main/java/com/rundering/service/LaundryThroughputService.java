package com.rundering.service;

import java.util.List;
import java.util.Map;

import com.rundering.command.BranchInfoDetailCommand;
import com.rundering.dto.BranchVO;
import com.rundering.dto.LaundryThroughPutVO;

public interface LaundryThroughputService {
	
	public List<LaundryThroughPutVO> getThroughputList() throws Exception;
	
	public Map<String, Object> getLaundryQuatoByThroughputNo(String throughputNo) throws Exception;
	
	public BranchInfoDetailCommand getBranchDetail(String branchCode) throws Exception;
	
}	
