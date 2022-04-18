package com.rundering.service;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;

import com.rundering.dao.ItemOrderDAO;
import com.rundering.dto.ItemOrderDetailVO;
import com.rundering.dto.ItemOrderVO;

public class ItemOrderServiceImpl implements ItemOrderService {
		
	ItemOrderDAO itemOrderDAO;
	
	public void setItemOrderDAO(ItemOrderDAO itemOrderDAO) {
		this.itemOrderDAO = itemOrderDAO;
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
		}
		
		
	}
	
	
	


}
