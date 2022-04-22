package com.rundering.service;

import java.util.List;

import com.rundering.dao.BranchDAOImpl;
import com.rundering.dto.BranchVO;

public class BranchServiceImpl implements BranchService {

	BranchDAOImpl branchDAO;

	public void setBranchDAO(BranchDAOImpl branchDAO) {
		this.branchDAO = branchDAO;
	}

	// 전체 지점정보 가져오기
	@Override
	public List<BranchVO> getBranchList() throws Exception {

		List<BranchVO> branchList = branchDAO.getBranchList();
		
		return branchList;
	}

	//로그인시 해당 사원의 지점코드를 통한 지점 정보 가져오기
	@Override
	public BranchVO getBranchByCode(String branchCode) throws Exception {

		BranchVO bv = branchDAO.getBranchByCode(branchCode);
		
		return bv;
	}

	
}
