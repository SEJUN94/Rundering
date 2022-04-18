package com.rundering.service;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.rundering.dao.ItemOrderDAO;
import com.rundering.dto.ItemOrderVO;
import com.rundering.manage.Criteria;
import com.rundering.manage.PageMaker;

public class itemOrderServiceImpl implements ItemOrderService{
	private ItemOrderDAO itemOrderDAO;
	
	public void setItemOrderDAO(ItemOrderDAO itemOrderDAO) {
		this.itemOrderDAO = itemOrderDAO;
	}
	
	@Override
	public Map<String, Object> getItemOrderList(Criteria cri) throws SQLException {
		Map<String, Object> dataMap = new HashMap<String, Object>();
		
		// 현재 page 번호에 맞게 리스트를 가져오기
		List<ItemOrderVO> itemOrderList = itemOrderDAO.selectSearchItemOrderList(cri);

		// 전체 board 개수
		int totalCount = itemOrderDAO.selectSearchItemOrderListCount(cri);
		
		// PageMaker 생성.
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(totalCount);

		dataMap.put("itemOrderList", itemOrderList);
		dataMap.put("pageMaker", pageMaker);
		
		return dataMap;
	}
	
}
