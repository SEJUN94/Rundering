package com.rundering.dao;

import org.apache.ibatis.session.SqlSession;

public class AttachDAOImpl implements AttachDAO{
	SqlSession session;
	
	public void setSession(SqlSession session) {
		this.session = session;
	}
	
	//atch_file_no_seq.nextval
	@Override
	public int selectFileNo() throws Exception {
		int seq= session.selectOne("Attach-Mapper.selectFileNo");
		return seq;
	}

	

}
