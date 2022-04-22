package com.rundering.dao;

import java.sql.SQLException;

public interface LaundryFixturesDAO {

	String getFixturesCodeAsRequest(String branchCode, String fixturesName) throws SQLException;
}
