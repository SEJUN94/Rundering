package com.rundering.service;

import java.util.List;
import java.util.Map;

import com.rundering.command.AppCriteria;
import com.rundering.command.BranchInfoDetailCommand;
import com.rundering.dto.LaundryThroughPutVO;

public interface LaundryThroughputService {
	
	public Map<String, Object> getThroughputList(AppCriteria cri) throws Exception;
	
	public Map<String, Object> getLaundryQuatoByThroughputNo(String throughputNo) throws Exception;
	
	public BranchInfoDetailCommand getBranchDetail(String branchCode) throws Exception;
	
	public List<LaundryThroughPutVO> branchQuotaTable(String branchCode) throws Exception;
	
	public List<LaundryThroughPutVO> branchTableDate(String date) throws Exception;
	
}	
