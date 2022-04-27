package com.rundering.dao;

import java.util.List;

import com.rundering.command.Criteria;
import com.rundering.dto.LaundryOrderVO;

public interface DeliveryDAO {
	List<LaundryOrderVO> selectDeliveryList(Criteria cri) throws Exception;
	
	int selectDeliveryCriteriaTotalCount(Criteria cri) throws Exception;
}
