package com.rundering.service;

import java.util.List;

import com.rundering.dao.LaundryThroughputDAO;
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
	public LaundryThroughPutVO getLaundryQuatoByThroughputNo(String throughputNo) throws Exception {
		LaundryThroughPutVO throughput = laundryThroughputDAO.selectLaundryQuatoByThroughputNo(throughputNo);
		
		return throughput;
	}
}
