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
	
	//로그인시 해당 사원의 지점코드를 통한 지점 정보 가져오기
	@Override
	public BranchVO getBranchByCode(String branchCode) throws Exception {
		BranchVO bv = session.selectOne("Branch-Mapper.getBranchByCode",branchCode);
		return bv;
	}

}
