package com.rundering.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.rundering.command.BranchInfoDetailCommand;
import com.rundering.dao.LaundryThroughputDAO;
import com.rundering.dto.BranchVO;
import com.rundering.dto.LaundryThroughPutVO;

public class LaundryThroughputServiceImpl implements LaundryThroughputService{

	LaundryThroughputDAO laundryThroughputDAO;
	
	public void setLaundryThroughputDAO(LaundryThroughputDAO laundryThroughputDAO) {
		this.laundryThroughputDAO = laundryThroughputDAO;
	}
	
	@Override
	public List<LaundryThroughPutVO> getThroughputList() throws Exception {
		
		List<LaundryThroughPutVO> throughputList = laundryThroughputDAO.throughputList();
		
		return throughputList;
	}

	@Override
	public Map<String, Object> getLaundryQuatoByThroughputNo(String throughputNo) throws Exception {
		Map<String, Object> dataMap = new HashMap<String, Object>();
		
		LaundryThroughPutVO throughput = laundryThroughputDAO.selectLaundryQuatoByThroughputNo(throughputNo);
		List<LaundryThroughPutVO> throughputList =  laundryThroughputDAO.throughputList();
		
		dataMap.put("throughput", throughput);
		dataMap.put("throughputList", throughputList);
		
		return dataMap;
	}

	@Override
	public BranchInfoDetailCommand getBranchDetail(String branchCode) throws Exception {
		BranchInfoDetailCommand branchDetail = laundryThroughputDAO.selectBranchDetail(branchCode);
		
		return branchDetail;
	}
}
