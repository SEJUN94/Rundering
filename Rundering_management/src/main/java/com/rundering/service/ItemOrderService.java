package com.rundering.service;


import com.rundering.dto.ItemOrderDetailVO;
import com.rundering.dto.ItemOrderVO;

public interface ItemOrderService {

	void insertItemOrder(ItemOrderVO itemOrder, ItemOrderDetailVO itemOrderDetail) throws Exception;
	
}
