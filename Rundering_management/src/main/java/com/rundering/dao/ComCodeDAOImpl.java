package com.rundering.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.rundering.dto.ComCodeVO;

public class ComCodeDAOImpl implements ComCodeDAO{
	
	SqlSession session;
	public void setSession(SqlSession session) {
		this.session = session;
	}
	
	@Override
	public List<ComCodeVO> selectItemOrderCode() throws Exception {
		return session.selectList("ComCode-Mapper.selectItemOrderCode");
	}

	@Override
	public List<ComCodeVO> selectLaundryStatusCode() throws Exception {
	
		return session.selectList("ComCode-Mapper.selectLaundryStatusCode");
	}

	@Override
	public List<ComCodeVO> selectComCodeByComCodeGrp(String comCodeGrp) throws Exception {
		return session.selectList("ComCode-Mapper.selectComCodeByComCodeGrp",comCodeGrp);
	}
	@Override
	public List<ComCodeVO> selectComCodeByUpperComCode(String comCodeGrp) throws Exception {
		return session.selectList("ComCode-Mapper.selectComCodeByUpperComCode",comCodeGrp);
	}


}
