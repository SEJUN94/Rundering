package com.rundering.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.rundering.command.Criteria;
import com.rundering.command.PageMaker;
import com.rundering.dao.DeliveryDAO;
import com.rundering.dto.LaundryOrderVO;

public class DeliveryServiceImpl implements DeliveryService{

	private DeliveryDAO deliveryDAO;
	
	public void setLaundryOrderDAO(DeliveryDAO deliveryDAO) {
		this.deliveryDAO = deliveryDAO;
	}
	
	@Override
	public Map<String, Object> getDeliveryList(Criteria cri) throws Exception {
		Map<String, Object> dataMap = new HashMap<String, Object>();
		
		List<LaundryOrderVO> deliveryList = deliveryDAO.selectDeliveryList(cri);
		
		// 전체 board 개수
		int totalCount = deliveryDAO.selectDeliveryCriteriaTotalCount(cri);
		// PageMaker 생성.
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(totalCount);

		dataMap.put("deliveryList", deliveryList);
		dataMap.put("pageMaker", pageMaker);
		
		return dataMap;
	}
	
}
