package com.rundering.service;

import java.util.Map;

import com.rundering.command.AppCriteria;
import com.rundering.command.BranchInfoDetailCommand;

public interface LaundryThroughputService {
	
	public Map<String, Object> getThroughputList(AppCriteria cri) throws Exception;
	
	public Map<String, Object> getLaundryQuatoByThroughputNo(String throughputNo) throws Exception;
	
	public BranchInfoDetailCommand getBranchDetail(String branchCode) throws Exception;
	
}	
