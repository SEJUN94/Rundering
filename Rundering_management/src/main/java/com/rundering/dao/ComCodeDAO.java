package com.rundering.dao;

import java.util.List;

import com.rundering.dto.ComCodeVO;

public interface ComCodeDAO {
	
	public List<ComCodeVO> selectItemOrderCode() throws Exception;
	public List<ComCodeVO> selectLaundryStatusCode() throws Exception;
	public List<ComCodeVO> selectComCodeByComCodeGrp(String comCodeGrp) throws Exception;
	public List<ComCodeVO> selectComCodeByUpperComCode(String comCodeGrp) throws Exception;
	
}
