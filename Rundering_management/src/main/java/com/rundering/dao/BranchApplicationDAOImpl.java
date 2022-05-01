package com.rundering.dao;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;

import com.rundering.command.Criteria;
import com.rundering.dto.BranchApplicationVO;

public class BranchApplicationDAOImpl implements BranchApplicationDAO{
	
	SqlSession session;
	public void setSession(SqlSession session) {
		this.session = session;
	}
	
	@Override
	public List<BranchApplicationVO> selectBranchApplication(Criteria cri) throws Exception {
		int offset=cri.getStartRowNum();
		int limit=cri.getPerPageNum();		
		RowBounds rowBounds=new RowBounds(offset,limit);	
		
		return session.selectList("BranchApplication-Mapper.selectBranchApplication",cri,rowBounds);
	}
	@Override
	public BranchApplicationVO selectBranchApplicationByapplicationNo() throws Exception {
		return session.selectOne("BranchApplication-Mapper.selectBranchApplication");
	}

	@Override
	public int selectBranchApplicationCount(Criteria cri) throws Exception {
		
		return session.selectOne("BranchApplication-Mapper.selectBranchApplicationCount", cri);
	}

	@Override
	public void updateApprovalreturnContentsByBranchApplicationVO(BranchApplicationVO branchApplication)
			throws Exception {
		 session.selectOne("BranchApplication-Mapper.updateApprovalreturnContentsByBranchApplicationVO");
		
	}

	@Override
	public void updateApprovalreturnYByBranchApplicationVO(BranchApplicationVO branchApplication) throws Exception {
		 session.selectOne("BranchApplication-Mapper.updateApprovalreturnYByBranchApplicationVO");
		
	}
	
	
}
