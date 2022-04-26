package com.rundering.service;

import java.util.List;
import java.util.Map;

import com.rundering.command.BranchCriteria;
import com.rundering.command.Criteria;
import com.rundering.dto.AttachVO;
import com.rundering.dto.LaundryOrderVO;

public interface LaundryOrderService {

	Map<String, Object> laundryOrderList(BranchCriteria cri) throws Exception;

	void updateStatus(List<LaundryOrderVO> laundryOrderList) throws Exception;
	public List<AttachVO> selectAttachList(String attchNo) throws Exception;

	
	Map<String, Object> getAdminlaundryOrderList(Criteria cri) throws Exception;
	
	Map<String, Object> getlaundryOrderByOrderNo(String orderNo) throws Exception;
	
}
