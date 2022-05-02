package com.rundering.dao;

import org.apache.ibatis.session.SqlSession;

import com.rundering.dto.BranchApplicationVO;

public class BranchApplicationDAOImpl implements BranchApplicationDAO {
	SqlSession session;

	public void setSession(SqlSession session) {
		this.session = session;
	}

	// 지점신청
	@Override
	public void branchApplicate(BranchApplicationVO bv) throws Exception {
		session.update("BranchApplication-Mapper.insertBranchApplication",bv);
	}

	@Override
	public BranchApplicationVO selectSelfAuthentification(BranchApplicationVO bv) throws Exception {
		bv = session.selectOne("BranchApplication-Mapper.selectSelfAuthentification", bv);
		
		return bv;
	}
	

}
