package com.rundering.service;

import java.util.List;

import com.rundering.dto.LaundryThroughPutVO;

public interface LaundryThroughputService {
	
	public List<LaundryThroughPutVO> getThroughputList() throws Exception;
	
	public LaundryThroughPutVO getLaundryQuatoByThroughputNo(String throughputNo) throws Exception;
}	
