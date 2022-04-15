package com.rundering.dao;

import org.apache.ibatis.session.SqlSession;

import com.rundering.dto.AttachVO;

public class AttachDAOImpl implements AttachDAO{
	SqlSession session;
	
	public void setSession(SqlSession session) {
		this.session = session;
	}
	
	@Override
	public void insertOrderGoodsAtach(AttachVO attach) throws Exception {
		session.update("Attach-Mapper.insertOrderGoodsAtach",attach);
	}
	@Override
	public int selectFileNo() throws Exception {
		int seq= session.selectOne("Attach-Mapper.selectFileNo");
		return seq;
	}
	

}
