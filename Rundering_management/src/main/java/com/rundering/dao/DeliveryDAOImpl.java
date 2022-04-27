package com.rundering.dao;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;

import com.rundering.command.Criteria;
import com.rundering.dto.LaundryOrderDetailVO;
import com.rundering.dto.LaundryOrderVO;

public class DeliveryDAOImpl implements DeliveryDAO{
	
	private SqlSession session;
	
	public void setSession(SqlSession session) {
		this.session = session;
	}

	@Override
	public List<LaundryOrderVO> selectDeliveryList(String orderStatus) throws Exception {

		List<LaundryOrderVO> collect = session.selectList("Delivery-Mapper.selectDeliveryList", orderStatus);
		
		return collect;
	}

	@Override
	public LaundryOrderVO selectDeliveryByOrderNo(String orderNo) throws Exception {
		
		LaundryOrderVO delivery = session.selectOne("Delivery-Mapper.selectDeliveryByorderNo", orderNo);
		
		return delivery;
	}

	@Override
	public List<LaundryOrderDetailVO> selectOrderListByOrderNo(String orderNo) throws Exception {
		List<LaundryOrderDetailVO> orderList = session.selectList("Delivery-Mapper.selectItemsListByOrderNo", orderNo);
		return orderList;
	}

	
	

}
