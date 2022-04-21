package com.rundering.service;

import java.util.ArrayList;
import java.util.List;

import com.rundering.dao.AttachDAO;
import com.rundering.dto.AttachVO;

public class AttachService {

	private AttachDAO attachDAO;
	public void setAttachDAO(AttachDAO attachDAO) {
		this.attachDAO = attachDAO;
	}

	public List<AttachVO> getAttachVOList(String fileNo) throws Exception {
		List<AttachVO> attachList = new ArrayList<AttachVO>();
		attachList = attachDAO.selectAttachVOByFileNo(fileNo);
		return attachList;
	}

	public void fileRemove(String fileNo) throws Exception {
		attachDAO.deleteAttchFileRemoveByFileNo(fileNo);
	}

	public int insertFile(List<AttachVO> attachList) throws Exception {
		int atchFileNo = attachDAO.selectFileNo();

		for (AttachVO attach : attachList) {
			attach.setAtchFileNo(String.valueOf(atchFileNo));
			attachDAO.insertAttach(attach);
		}
		return atchFileNo;
	}

}
