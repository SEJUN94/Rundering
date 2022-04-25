package com.rundering.dao;

import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;

import com.rundering.command.BranchCriteria;
import com.rundering.command.Criteria;
import com.rundering.dto.LaundryOrderVO;

public class LaundryOrderDAOImpl implements LaundryOrderDAO{
	
	private SqlSession session;
	public void setSession(SqlSession session) {
		this.session = session;
	}
	
	@Override
	public List<LaundryOrderVO> selectLaundryOrderList(BranchCriteria cri) throws Exception{
		int offset=cri.getStartRowNum();
		int limit=cri.getPerPageNum();		
		RowBounds rowBounds=new RowBounds(offset,limit);
		return session.selectList("LaundryOrder-Mapper.selectLaundryOrderList", cri,rowBounds);
		
	}
	@Override
	public int selectCount(BranchCriteria cri) throws Exception{
		int count = session.selectOne("LaundryOrder-Mapper.selectCount",cri);
		return count;
	}
	@Override
	public int selectCount(Criteria cri) throws Exception{
		int count = session.selectOne("LaundryOrder-Mapper.selectAdminLaundryOrderListCount",cri);
		return count;
	}

	@Override
	public void updateLaundryOrderStatusByOrderNo(LaundryOrderVO laundryOrderVO) throws Exception {
		session.update("LaundryOrder-Mapper.updateLaundryOrderStatusByOrderNo", laundryOrderVO);
		
	}

	@Override
	public List<LaundryOrderVO> selectAdminLaundryOrderList(Criteria cri) throws Exception {
		int offset=cri.getStartRowNum();
		int limit=cri.getPerPageNum();		
		RowBounds rowBounds=new RowBounds(offset,limit);
		return session.selectList("LaundryOrder-Mapper.selectAdminLaundryOrderList",cri,rowBounds);
	}

	@Override
	public LaundryOrderVO selectLaundryOrderByOrderNo(String orderNo) throws SQLException {
		return session.selectOne("LaundryOrder-Mapper.selectLaundryOrderByOrderNo",orderNo);
	}

	@Override
	public List<LaundryOrderVO> selectLaundryOrderListNotAssignedToBranchByArea(String area) throws Exception {
		return session.selectList("LaundryOrder-Mapper.selectLaundryOrderListNotAssignedToBranchByArea",area);
	}

	@Override
	public void updateLaundryOrderbranchCode(LaundryOrderVO laundryOrder) throws Exception {
		session.update("LaundryOrder-Mapper.updateLaundryOrderbranchCode", laundryOrder);
	}



	
	
	


}
