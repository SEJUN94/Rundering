package com.rundering.service;

import java.sql.SQLException;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.rundering.dao.ComCodeDAO;
import com.rundering.dao.LaundryItemsDAO;
import com.rundering.dao.LaundryOrderDAO;
import com.rundering.dao.LaundryOrderDetailDAO;
import com.rundering.dao.ReplyDAO;
import com.rundering.dto.LaundryOrderVO;
import com.rundering.dto.ReplyVO;
import com.rundering.util.BranchCriteria;
import com.rundering.util.BranchPageMaker;
import com.rundering.util.ComCodeUtil;

public class LaundryOrderServiceImpl implements LaundryOrderService {
	
	private LaundryOrderDAO laundryOrderDAO;
	public void setLaundryOrderDAO(LaundryOrderDAO laundryOrderDAO) {
		this.laundryOrderDAO = laundryOrderDAO;
	}
	private LaundryOrderDetailDAO laundryOrderDetailDAO;
	public void setLaundryOrderDetailDAO(LaundryOrderDetailDAO laundryOrderDetailDAO) {
		this.laundryOrderDetailDAO = laundryOrderDetailDAO;
	}
	private LaundryItemsDAO laundryItemsDAO;
	public void setLaundryItemsDAO(LaundryItemsDAO laundryItemsDAO) {
		this.laundryItemsDAO = laundryItemsDAO;
	}
	private ReplyDAO replyDAO;
	public void setReplyDAO(ReplyDAO replyDAO) {
		this.replyDAO = replyDAO;
	}
	private ComCodeDAO comCodeDAO;
	public void setComCodeDAO(ComCodeDAO comCodeDAO) {
		this.comCodeDAO = comCodeDAO;
	}
	@Override
	public Map<String,Object> laundryOrderList(BranchCriteria cri) throws Exception{
		ComCodeUtil comCodeUtil =new ComCodeUtil();
		Map<String, Object> dataMap = new HashMap<String, Object>();
		Map<String,String> orderCodeMap = new HashMap<String, String>();
		Map<String,String> laundryCodeMap = new HashMap<String, String>();
		comCodeUtil.getCodeMap("LAUNDRY_STATUS", laundryCodeMap, comCodeDAO);
		comCodeUtil.getUpperCodeMap("ORDER_STATUS", orderCodeMap, comCodeDAO);
		
		List<LaundryOrderVO> laundryOrderList = laundryOrderDAO.selectLaundryOrderList(cri);
		
		// 전체 board 개수
		int totalCount = laundryOrderDAO.selectCount(cri);

		// PageMaker 생성.
		BranchPageMaker pageMaker = new BranchPageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(totalCount);

		dataMap.put("laundryOrderList", laundryOrderList);
		dataMap.put("pageMaker", pageMaker);
		dataMap.put("laundryCodeMap",laundryCodeMap);
		dataMap.put("orderCodeMap",orderCodeMap);

		return dataMap;
	}
	@Override
	public void updateStatus(List<LaundryOrderVO> laundryOrderList) throws Exception{
		for (LaundryOrderVO laundryOrder : laundryOrderList) {
			laundryOrderDAO.updateLaundryOrderStatusByOrderNo(laundryOrder);
		}
	}
	public void insertRequest(ReplyVO peply) throws Exception{
		
		
	}
	
}
