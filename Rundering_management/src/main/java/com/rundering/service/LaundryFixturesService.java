package com.rundering.service;

import java.sql.SQLException;
import java.util.List;

import com.rundering.dto.LaundryFixturesVO;

public interface LaundryFixturesService {

	String getFixturesCodeAsRequest(String branchCode, String fixturesName) throws SQLException;

	List<LaundryFixturesVO> selectBranchFixturesList(String branchCode) throws Exception;
}
