package com.rundering.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.rundering.command.BranchCriteria;
import com.rundering.dto.ItemVO;
import com.rundering.dto.LaundryGoodsStockVO;

public class LaundryGoodsStockDAOImpl implements LaundryGoodsStockDAO{
	SqlSession session;
	
	public void setSession(SqlSession session) {
		this.session = session;
	}
	
	@Override
	public void insertLaundryGoodsStock(LaundryGoodsStockVO laundryGoodsStock) throws Exception {
		session.insert("LaundryGoodsStock-Mapper.insertLaundryGoodsStock",laundryGoodsStock);
	}

	@Override
	public void updateLaundryGoodsStockCountByVO(LaundryGoodsStockVO laundryGoodsStock) throws Exception {
		session.update("LaundryGoodsStock-Mapper.updateLaundryGoodsStockCountByVO", laundryGoodsStock);
	}

	@Override
	public List<ItemVO> selectItemListByBranchCode(BranchCriteria cri) throws Exception {
		return session.selectList("LaundryGoodsStock-Mapper.selectItemListByBranchCode", cri);
	}

	@Override
	public int selectItemCountByBranchCode(BranchCriteria cri) throws Exception {
		return session.selectOne("LaundryGoodsStock-Mapper.selectItemCountByBranchCode",cri );
	}

	@Override
	public void updateLaundryGoodsStockAutoOrderByVO(LaundryGoodsStockVO laundryGoodsStock) throws Exception {
		 session.update("LaundryGoodsStock-Mapper.updateLaundryGoodsStockAutoOrderByVO", laundryGoodsStock);
	}


}
