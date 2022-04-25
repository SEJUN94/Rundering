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
	public List<BranchVO> selectBranchList() throws Exception {
		List<BranchVO> branchList = session.selectList("Branch-Mapper.selectBranchList");
		return branchList;
	}
	//지점조회 - by branchCode
	@Override
	public BranchVO selectBranchByBranchCode(String branchCode) throws Exception {
		return session.selectOne("Branch-Mapper.selectBranchByBranchCode", branchCode);
	}
	// 전체 지점정보 가져오기
	public List<BranchVO> selectBranchListByArea(String area) throws Exception {
		List<BranchVO> branchList = session.selectList("Branch-Mapper.selectBranchListByArea",area);
		return branchList;
	}

}
