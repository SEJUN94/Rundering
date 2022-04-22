package com.rundering.service;

import java.util.List;

import com.rundering.dto.BranchVO;

public interface BranchService {

	// 전체 지점정보 가져오기
	public List<BranchVO> getBranchList() throws Exception;
		
}
