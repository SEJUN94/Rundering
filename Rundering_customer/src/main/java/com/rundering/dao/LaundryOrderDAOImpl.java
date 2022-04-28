package com.rundering.dao;

import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;

import com.rundering.command.MyOrderCriteria;
import com.rundering.dto.LaundryOrderVO;

public class LaundryOrderDAOImpl implements LaundryOrderDAO{
	
	private SqlSession session;
	public void setSession(SqlSession session) {
		this.session = session;
	}
	
	// 세탁주문번호생성
	@Override
	public String selectLaundryOrderSequenceNextValue() throws SQLException {
		String orderNo = session.selectOne("LaundryOrder-Mapper.selectLaundryOrderSequenceNextValue");
		return orderNo;
	}
	
	// 세탁주문접수
	@Override
	public void insertLaundryOrder(LaundryOrderVO laundryOrder) throws SQLException {
		session.update("LaundryOrder-Mapper.insertLaundryOrder", laundryOrder);
	}

	@Override
	public LaundryOrderVO selectLaundryOrderByOrderNo(String orderNo) throws SQLException {
		LaundryOrderVO laundryOrder = session.selectOne("LaundryOrder-Mapper.selectLaundryOrderByOrderNo",orderNo);
		return laundryOrder;
	}
	
	// 마이페이지 - 내 주문내역 가져오기
	@Override
	public List<LaundryOrderVO> getMyOrderList(MyOrderCriteria cri) throws Exception {
		
		//페이징 처리를 위한 것들
		int offset = cri.getStartRowNum();
		int limit = cri.getPerPageNum();
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		List<LaundryOrderVO> myOrderList = session.selectList("LaundryOrder-Mapper.getmyorderList", cri, rowBounds);

		return myOrderList;
	}
	
	// 마이페이지 - 주문내역 전체 개수 체크
	@Override
	public int myOrderList(MyOrderCriteria cri) throws SQLException {
		int count = session.selectOne("LaundryOrder-Mapper.myOrderListCount", cri);
		return count;
	}


}
