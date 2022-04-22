package com.rundering.service;

import java.util.List;

import com.rundering.dto.ComCodeVO;

public interface ComCodeService {

	// 전체 부서 가져오기
	public List<ComCodeVO> getDepartment() throws Exception;
	
}
