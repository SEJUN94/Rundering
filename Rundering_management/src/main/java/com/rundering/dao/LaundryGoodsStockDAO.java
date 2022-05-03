package com.rundering.dao;

import com.rundering.dto.LaundryGoodsStockVO;

public interface LaundryGoodsStockDAO {
	public void insertLaundryGoodsStock(LaundryGoodsStockVO laundryGoodsStock) throws Exception;
	public void updateLaundryGoodsStockCountByVO(LaundryGoodsStockVO laundryGoodsStock) throws Exception;
	
}
