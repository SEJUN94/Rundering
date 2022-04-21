package com.rundering.service;

import java.sql.SQLException;

import com.rundering.dao.LaundryFixturesDAO;

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

}
