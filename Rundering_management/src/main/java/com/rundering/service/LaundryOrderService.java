package com.rundering.service;

import java.util.List;
import java.util.Map;

import com.rundering.command.BranchCriteria;
import com.rundering.command.Criteria;
import com.rundering.dto.LaundryOrderVO;
import com.rundering.dto.ReplyVO;

public interface LaundryOrderService {

	Map<String, Object> laundryOrderList(BranchCriteria cri) throws Exception;

	void updateStatus(List<LaundryOrderVO> laundryOrderList) throws Exception;
	public void insertRequest(ReplyVO peply) throws Exception;
	
	Map<String, Object> getAdminlaundryOrderList(Criteria cri) throws Exception;
			
	
}
