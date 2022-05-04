package com.rundering.dao;

import java.util.List;

import com.rundering.command.BranchCriteria;
import com.rundering.dto.ItemVO;
import com.rundering.dto.LaundryGoodsStockVO;

public interface LaundryGoodsStockDAO {
	public void insertLaundryGoodsStock(LaundryGoodsStockVO laundryGoodsStock) throws Exception;
	public void updateLaundryGoodsStockCountByVO(LaundryGoodsStockVO laundryGoodsStock) throws Exception;
	public List<ItemVO> selectItemListByBranchCode(BranchCriteria cri) throws Exception;
	public int selectItemCountByBranchCode(BranchCriteria cri) throws Exception;
}
 