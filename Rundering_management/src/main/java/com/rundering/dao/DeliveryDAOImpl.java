package com.rundering.dao;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;

import com.rundering.command.Criteria;
import com.rundering.dto.LaundryOrderVO;

public class DeliveryDAOImpl implements DeliveryDAO{
	
	private SqlSession session;
	
	public void setSession(SqlSession session) {
		this.session = session;
	}

	@Override
	public List<LaundryOrderVO> selectDeliveryList(Criteria cri) throws Exception {
		
		int offset=cri.getStartRowNum();
		int limit=cri.getPerPageNum();		
		RowBounds rowBounds=new RowBounds(offset,limit);		
		
		List<LaundryOrderVO> collect = session.selectList("Delivery-Mapper.selectDeliveryList",cri, rowBounds);
		
		return collect;
	}

	@Override
	public int selectDeliveryCriteriaTotalCount(Criteria cri) throws Exception {
		
		int count = session.selectOne("Delivery-Mapper.selectDeliveryListCount", cri);
		
		return count;
	}
}
