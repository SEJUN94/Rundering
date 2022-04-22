package com.rundering.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.rundering.dto.BranchVO;

public class BranchDAOImpl implements BranchDAO {
	
	SqlSession session;

	public void setSession(SqlSession session) {
		this.session = session;
	}
	
	// 전체 지점정보 가져오기
	public List<BranchVO> getBranchList() throws Exception {
		List<BranchVO> branchList = session.selectList("Branch-Mapper.getBranchList");
		return branchList;
	}

}
