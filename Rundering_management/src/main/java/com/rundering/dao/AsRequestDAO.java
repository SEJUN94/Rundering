package com.rundering.dao;

import java.sql.SQLException;
import java.util.List;

import com.rundering.dto.AsRequestVO;
import com.rundering.manage.Criteria;

public interface AsRequestDAO {

	List<AsRequestVO> selectSearchAsRequestList(Criteria cri) throws SQLException;

	int selectSearchAsRequestListCount(Criteria cri) throws SQLException;

	AsRequestVO selectAsRequestByAsno(int asno) throws SQLException;

	/* void increaseViewCount(int asno) throws SQLException; */

	void checkAsRequest(int asno) throws SQLException;

	int selectAsRequestSequenceNextValue() throws SQLException;

	void insertAsRequest(AsRequestVO AsRequest) throws SQLException;
	
	void selectItemList(AsRequestVO AsRequest) throws SQLException;

	void updateAsRequest(AsRequestVO AsRequest) throws SQLException;

	void deleteAsRequest(int asno) throws SQLException;
}
