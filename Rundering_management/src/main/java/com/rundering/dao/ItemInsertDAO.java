package com.rundering.dao;

import com.rundering.dto.ItemInsertVO;
import com.rundering.dto.ItemVO;

public interface ItemInsertDAO {
	public void insertItemIsert(ItemInsertVO itemInsert) throws Exception;
	public ItemVO selectDayItemByItem(ItemVO item) throws Exception;
}
