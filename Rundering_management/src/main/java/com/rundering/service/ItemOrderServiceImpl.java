package com.rundering.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;

import com.rundering.command.Criteria;
import com.rundering.command.PageMaker;
import com.rundering.dao.ComCodeDAO;
import com.rundering.dao.ItemOrderDAO;
import com.rundering.dto.ComCodeVO;
import com.rundering.dto.EmployeesVO;
import com.rundering.dto.ItemOrderDetailVO;
import com.rundering.dto.ItemOrderVO;

public class ItemOrderServiceImpl implements ItemOrderService {
		
	ItemOrderDAO itemOrderDAO;
	
	ComCodeDAO comCodeDAO;
	
	public void setItemOrderDAO(ItemOrderDAO itemOrderDAO) {
		this.itemOrderDAO = itemOrderDAO;
	}
	public void setComCodeDAO(ComCodeDAO comCodeDAO) {
		this.comCodeDAO = comCodeDAO;
	}
	
	@Override
	public void insertItemOrder(ItemOrderVO itemOrder,List<ItemOrderDetailVO> itemOrderDetailList) throws Exception {
		String seq = itemOrderDAO.seq();
		itemOrder.setOrdercode(seq);
		itemOrderDAO.insertItemOrderByItmeOrder(itemOrder);
		int i = 1;
		try {
			for (ItemOrderDetailVO itemOrderDetail : itemOrderDetailList) {
			itemOrderDetail.setSeq(i);	
			itemOrderDetail.setOrdercode(seq);
			itemOrderDAO.insertItemOrderDetailByItmeOrderDetail(itemOrderDetail);
			i++;
			}
		} catch (Exception e) {
			itemOrderDAO.itemOrderDetailRemove(seq);
			itemOrderDAO.itemOrderRemove(seq);
			e.printStackTrace();
			throw e;
		}
	}
	@Override
	public Map<String, Object> itemOrdeList(Criteria cri, HttpSession session) throws Exception{
		Map<String, Object> dataMap = new HashMap<String, Object>();
		Map<String,String> comCodeMap = new HashMap<String, String>();		
		Map<String,Integer> totalPriceMap = new HashMap<String,Integer>();
		List<ItemOrderVO> list = null; 
		List<ItemOrderVO> itemOrderList = new ArrayList<ItemOrderVO>();
		
		int totalPrice=0;
		
		EmployeesVO emp = (EmployeesVO)session.getAttribute("loginEmployee");
		
		 
		String empBranch= emp.getBranchCode();
		List<ComCodeVO> itemOrderComCode = comCodeDAO.selectItemOrderCode();
		list = itemOrderDAO.selectItemOrderList(cri);
		for (ItemOrderVO itemOrder : list) {
			if( empBranch.equals(itemOrder.getBranchCode())) {
				itemOrderList.add(itemOrder);
				totalPrice = itemOrderDAO.selectTotalPriceByOrderCode(itemOrder.getOrdercode());
				totalPriceMap.put(itemOrder.getOrdercode(), totalPrice);
			}
		}
		for (ComCodeVO comCode : itemOrderComCode) {
			comCodeMap.put(comCode.getComCode(), comCode.getComCodeNm());
		}
		
		
		int totalCount = itemOrderDAO.selectCount(cri);
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(totalCount);
		 
		dataMap.put("itemOrderList", itemOrderList);
		dataMap.put("pageMaker", pageMaker);
		dataMap.put("comCodeMap",comCodeMap);
		dataMap.put("totalPriceMap",totalPriceMap);
		return dataMap;
		
	}
	
	@Override
	public List<ItemOrderDetailVO> getItemOrdeDetail(String ordercode) throws Exception{
		List<ItemOrderDetailVO> itemOrderDetailList = null;
		itemOrderDetailList=itemOrderDAO.selectItemOrderDetailByOrdercode(ordercode);
		return itemOrderDetailList;
	}
	@Override
	public String getBranchCode(String ordercode) throws Exception{
		String branchCode =itemOrderDAO.selectItemOrderBranchCodeByOrdercode(ordercode);
		return branchCode;
		
	}
	@Override
	public ItemOrderVO getItemOrder(String ordercode) throws Exception{
		ItemOrderVO itemOrder = itemOrderDAO.selectItemOrderByOrdercode(ordercode);
		return itemOrder; 
	}
	@Override
	public Map<String,String> comCode() throws Exception{
		 Map<String, String> comCodeMap = new HashMap<String, String>();
		 List<ComCodeVO> itemOrderComCode = comCodeDAO.selectItemOrderCode();
		 for (ComCodeVO comCode : itemOrderComCode) {
				comCodeMap.put(comCode.getComCode(), comCode.getComCodeNm());
			}
		 return comCodeMap;
	}
	@Override
	public void updateState(ItemOrderVO itemOrder) throws Exception{
		itemOrderDAO.updateItemOrderStatusByOrderCode(itemOrder);
	}
	@Override
	public void deleteItemorder(String ordercode) throws Exception{
		itemOrderDAO.deleteItemOrderDetailRemove(ordercode);
		itemOrderDAO.deleteItemOrderRemoveByOrdercode(ordercode);
	}
	
} 
