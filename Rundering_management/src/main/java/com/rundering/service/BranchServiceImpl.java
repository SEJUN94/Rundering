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
		List<BranchVO> branchList = branchDAO.selectBranchList();
		return branchList;
	}

	
}
