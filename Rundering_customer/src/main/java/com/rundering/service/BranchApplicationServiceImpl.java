package com.rundering.service;

import com.rundering.dao.AttachDAO;
import com.rundering.dao.BranchApplicationDAO;
import com.rundering.dto.AttachVO;
import com.rundering.dto.BranchApplicationVO;

public class BranchApplicationServiceImpl implements BranchApplicationService {

	private BranchApplicationDAO branchApplicationDAO;
	private AttachDAO attachDAO;

	
	public void setAttachDAO(AttachDAO attachDAO) {
		this.attachDAO = attachDAO;
	}
	public void setBranchApplicationDAO(BranchApplicationDAO branchApplicationDAO) {
		this.branchApplicationDAO = branchApplicationDAO;
	}

	// 지점 신청
	@Override
	public void branchApplicate(BranchApplicationVO bv,AttachVO attach) throws Exception {
		
		// FILE_NO 변수에 저장해놓기
		int intNo =  attachDAO.selectFileNo();
		String atchFileNo = intNo + "";  
		attach.setFileContType("임대차계약서");
		bv.setFileNm(atchFileNo);
		attach.setAtchFileNo(atchFileNo);
		attach.setAtchFileSeq(1);
		
		// 임대차계약서(첨부파일) DB에 저장
		attachDAO.insertAttach(attach);
		// 지점신청
		branchApplicationDAO.branchApplicate(bv);
	}
	
	
	// 지점 신청 확인 들어가기전 본인인증
	@Override
	public BranchApplicationVO getSelfAuthentification(BranchApplicationVO bv) throws Exception {
		return branchApplicationDAO.selectSelfAuthentification(bv);
	}
	
	//지점 신청 심사내역
	@Override
	public void updateJudge(BranchApplicationVO bv) throws Exception {
		branchApplicationDAO.updateJudge(bv);
		
	}


}
