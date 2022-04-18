package com.rundering.dao;

import java.sql.SQLException;

import org.apache.ibatis.session.SqlSession;

import com.rundering.dto.MemberAddressVO;

public class MemberAddressDAOImpl implements MemberAddressDAO{
	SqlSession session;

	
	public void setSession(SqlSession session) {
		this.session = session;
	}

	
	@Override
	public void addRegist(MemberAddressVO memberAdd) throws Exception {
		session.update("MemberAddress-Mapper.addRegist",memberAdd);
	}


	@Override
	public MemberAddressVO selectDefaultMemberAddressByMemberNo(String memberNo) throws SQLException {
		return session.selectOne("MemberAddress-Mapper.selectDefaultMemberAddressByMemberNo", memberNo);
	}
	
	
}
