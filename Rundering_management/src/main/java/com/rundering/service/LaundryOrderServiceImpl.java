package com.rundering.service;

import java.sql.SQLException;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.rundering.dao.LaundryItemsDAO;
import com.rundering.dao.LaundryOrderDAO;
import com.rundering.dao.LaundryOrderDetailDAO;
import com.rundering.dao.ReplayDAO;
import com.rundering.dto.LaundryItemsVO;
import com.rundering.dto.LaundryOrderDetailVO;
import com.rundering.dto.LaundryOrderVO;
import com.rundering.dto.SuggestVO;
import com.rundering.manage.Criteria;
import com.rundering.manage.PageMaker;
import com.rundering.util.BranchCriteria;
import com.rundering.util.BranchPageMaker;

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
	private ReplayDAO replyDAO;
	public void setReplyDAO(ReplayDAO replyDAO) {
		this.replyDAO = replyDAO;
	}
	@Override
	public Map<String,Object> laundryOrderList(BranchCriteria cri) throws Exception{
		Map<String, Object> dataMap = new HashMap<String, Object>();

		// 현재 page 번호에 맞게 리스트를 가져오기
		List<LaundryOrderVO> laundryOrderList = laundryOrderDAO.selectLaundryOrderList(cri);
		System.out.println(laundryOrderList);
		// 전체 board 개수
		int totalCount = laundryOrderDAO.selectCount(cri);

		// PageMaker 생성.
		BranchPageMaker pageMaker = new BranchPageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(totalCount);

		dataMap.put("laundryOrderList", laundryOrderList);
		dataMap.put("pageMaker", pageMaker);

		return dataMap;
	}
	
}
