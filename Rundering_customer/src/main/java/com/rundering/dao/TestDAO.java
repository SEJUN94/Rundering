package com.rundering.dao;



import org.apache.ibatis.session.SqlSession;

import com.rundering.dto.TestVO;

public class TestDAO implements TestDAOBean{

	SqlSession session;
	
	public void setSession(SqlSession session) {
		this.session = session;
	}
	@Override
	public TestVO selectTestById(String id) throws Exception {
		TestVO test =  session.selectOne("Test-mapper.test",id);
		
		return test;
	}
	
}
