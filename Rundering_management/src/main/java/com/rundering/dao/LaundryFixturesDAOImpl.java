package com.rundering.dao;

import java.sql.SQLException;

import org.apache.ibatis.session.SqlSession;

public class LaundryFixturesDAOImpl implements LaundryFixturesDAO {

	private SqlSession session;

	public void setSession(SqlSession session) {
		this.session = session;
	}

	@Override
	public String getFixturesCodeAsRequest(String branchCode, String fixturesName) throws SQLException {
		String fixtures = session.selectOne("LaundryFixtures-mapper.getFixturesCodeAsRequest");
		return fixtures;
	}

}
