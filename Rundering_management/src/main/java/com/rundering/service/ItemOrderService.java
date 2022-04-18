package com.rundering.service;


import java.util.List;

import com.rundering.dto.ItemOrderDetailVO;
import com.rundering.dto.ItemOrderVO;

public interface ItemOrderService {


	void insertItemOrder(ItemOrderVO itemOrder, List<ItemOrderDetailVO> itemOrderDetailList) throws Exception;
	
}
