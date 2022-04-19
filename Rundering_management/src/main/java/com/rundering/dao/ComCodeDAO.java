package com.rundering.dao;

import java.util.List;

import com.rundering.dto.ComCodeVO;

public interface ComCodeDAO {
	
	public List<ComCodeVO> selectItemOrderCode() throws Exception;
}
