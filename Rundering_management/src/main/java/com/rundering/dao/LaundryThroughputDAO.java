package com.rundering.dao;

import java.util.List;

import com.rundering.dto.LaundryThroughPutVO;

public interface LaundryThroughputDAO {
	public List<LaundryThroughPutVO> throughputList() throws Exception;
	
	public LaundryThroughPutVO selectLaundryQuatoByThroughputNo(String throughputNo) throws Exception;
	
}
