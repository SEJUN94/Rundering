package com.rundering.dao;

import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.rundering.dto.LaundryArticlesVO;
import com.rundering.dto.LaundryFixturesVO;

public class LaundryFixturesDAOImpl implements LaundryFixturesDAO {

	private SqlSession session;

	public void setSession(SqlSession session) {
		this.session = session;
	}

	@Override
	public String getFixturesCodeAsRequest(String branchCode, String fixturesName) throws SQLException {
		String fixtures = session.selectOne("LaundryFixtures-Mapper.getFixturesCodeAsRequest");
		return fixtures;
	}
	@Override
	public List<LaundryFixturesVO> selectFixturesListByBranchCode(String branchCode) throws Exception{
		return  session.selectList("LaundryFixtures-Mapper.selectFixturesListByBranchCode", branchCode);
	}
	@Override
	public void insertFixturesByFixtrues(LaundryFixturesVO laundryFixtures) throws Exception {
		session.insert("LaundryFixtures-Mapper.insertFixturesByFixtrues", laundryFixtures);
	}

	@Override
	public LaundryFixturesVO selectLaundryFixtureByFixturesCode(String fixturesCode) throws Exception {
		return  session.selectOne("LaundryFixtures-Mapper.selectLaundryFixtureByFixturesCode", fixturesCode);
	}

}
