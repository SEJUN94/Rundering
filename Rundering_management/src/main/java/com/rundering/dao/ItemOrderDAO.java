package com.rundering.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.rundering.dto.ItemOrderDetailVO;
import com.rundering.dto.ItemOrderVO;
import com.rundering.manage.Criteria;

public interface ItemOrderDAO {
	public void insertItemOrderByItmeOrder(ItemOrderVO itemOrder) throws Exception;
	public void insertItemOrderDetailByItmeOrderDetail(ItemOrderDetailVO itemOrderDetail) throws Exception;
	public String seq() throws Exception;
	public void itemOrderRemove(String seq) throws Exception;
	public void itemOrderDetailRemove(String seq) throws Exception;
	public List<ItemOrderVO> selectItemOrderList(Criteria cri) throws Exception;
	public int selectCount(Criteria cri) throws Exception;
	public int selectTotalPriceByOrderCode(String ordercode) throws Exception;
	public List<ItemOrderDetailVO> selectItemOrderDetailByOrdercode(String ordercode) throws Exception;
	public String selectItemOrderBranchCodeByOrdercode(String ordercode) throws Exception;
	public ItemOrderVO selectItemOrderByOrdercode(String ordercode) throws Exception;
	public void updateItemOrderStatusByOrderCode(ItemOrderVO itemOrder) throws Exception;
	public void deleteItemOrderRemoveByOrdercode(String ordercode) throws Exception;
	public void deleteItemOrderDetailRemove(String ordercode) throws Exception;
 
} 