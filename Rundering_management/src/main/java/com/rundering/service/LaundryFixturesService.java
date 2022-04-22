package com.rundering.service;

import java.sql.SQLException;

public interface LaundryFixturesService {

	String getFixturesCodeAsRequest(String branchCode, String fixturesName) throws SQLException;
}
