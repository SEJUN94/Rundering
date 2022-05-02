package com.rundering.service;

import java.sql.SQLException;
import java.util.List;

import com.rundering.dao.LaundryFixturesDAO;
import com.rundering.dto.LaundryFixturesVO;

public class LaundryFixturesServiceImpl implements LaundryFixturesService {

	private LaundryFixturesDAO laundryFixturesDAO;

	public void setLaundryFixturesDAO(LaundryFixturesDAO laundryFixturesDAO) {
		this.laundryFixturesDAO = laundryFixturesDAO;
	}

	@Override
	public String getFixturesCodeAsRequest(String branchCode, String fixturesName) throws SQLException {
		String fixtures = laundryFixturesDAO.getFixturesCodeAsRequest(branchCode, fixturesName);
		return fixtures;
	}
	@Override
	public List<LaundryFixturesVO> selectBranchFixturesList(String branchCode) throws Exception {
		return 	laundryFixturesDAO.selectFixturesListByBranchCode(branchCode);
	}

}
