package com.rundering.dao;

import java.util.List;

import com.rundering.dto.BranchVO;

public interface BranchDAO {
	
	// 전체 지점정보 가져오기
	public List<BranchVO> selectBranchList() throws Exception;
	
	//지점조회 - by branchCode
	public BranchVO selectBranchByBranchCode(String branchCode) throws Exception; 
	
}
