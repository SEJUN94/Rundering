package com.rundering.service;

import java.util.List;
import java.util.Map;

import com.rundering.command.BranchCriteria;
import com.rundering.dto.ItemVO;

public interface ItemService {


	Map<String, Object> selectItemVOList(BranchCriteria cri) throws Exception;
	
	List<ItemVO> selectDDItemByItem(ItemVO item) throws Exception;
	List<ItemVO> selectMMItemByItem(ItemVO item) throws Exception;
	List<ItemVO> selectYYItemByItem(ItemVO item) throws Exception;

	List<ItemVO> select3MItemByItem(ItemVO item) throws Exception;
};
