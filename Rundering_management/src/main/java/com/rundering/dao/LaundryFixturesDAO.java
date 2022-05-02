package com.rundering.dao;

import java.sql.SQLException;
import java.util.List;

import com.rundering.dto.LaundryFixturesVO;

public interface LaundryFixturesDAO {

	String getFixturesCodeAsRequest(String branchCode, String fixturesName) throws SQLException;

	List<LaundryFixturesVO> selectFixturesListByBranchCode(String branchCode) throws Exception;
}
