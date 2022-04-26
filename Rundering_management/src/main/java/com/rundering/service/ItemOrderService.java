package com.rundering.service;


import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import com.rundering.command.CustomerListCriteria;
import com.rundering.dto.ItemOrderDetailVO;
import com.rundering.dto.ItemOrderVO;
import com.rundering.util.BranchCriteria;

public interface ItemOrderService {


	public void insertItemOrder(ItemOrderVO itemOrder, List<ItemOrderDetailVO> itemOrderDetailList) throws Exception;




	public List<ItemOrderDetailVO> getItemOrdeDetail(String ordercode) throws Exception;


	public String getBranchCode(String ordercode) throws Exception;


	public ItemOrderVO getItemOrder(String ordercode) throws Exception;


	public Map<String, String> comCode() throws Exception;


	public void updateState(ItemOrderVO itemOrder) throws Exception;


	public void deleteItemorder(String ordercode) throws Exception;


	public Map<String, Object> itemOrdeList(BranchCriteria cri, HttpSession session) throws Exception;
	
}
