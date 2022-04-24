package com.rundering.service;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import com.rundering.dto.AttachVO;
import com.rundering.dto.LaundryOrderDetailVO;
import com.rundering.dto.LaundryOrderVO;
import com.rundering.dto.ReplyVO;
import com.rundering.manage.Criteria;
import com.rundering.util.BranchCriteria;

public interface LaundryOrderService {

	Map<String, Object> laundryOrderList(BranchCriteria cri) throws Exception;

	void updateStatus(List<LaundryOrderVO> laundryOrderList) throws Exception;
	public List<AttachVO> selectAttachList(String attchNo) throws Exception;

	
			
	
}
