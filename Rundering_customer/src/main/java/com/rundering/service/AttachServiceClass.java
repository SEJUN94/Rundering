package com.rundering.service;

import java.util.List;

import com.rundering.dao.AttachDAO;
import com.rundering.dto.AttachVO;

public class AttachServiceClass {

	AttachDAO attachDAO;
	public void setAttachDAO(AttachDAO attachDAO) {
		this.attachDAO = attachDAO;
	}
	public List<AttachVO> getAttachVOList(String fileNo,List<AttachVO> attachList) throws Exception{
		
		attachList=attachDAO.selectAttachVOByFileNo(fileNo);
		
		return attachList;
	}
	public void fileRemove(String fileNo) throws Exception {
		attachDAO.deleteAttchFileRemoveByFileNo(fileNo);
	}
	public void insertFile(List<AttachVO> attachList) throws Exception{
		int seq =attachDAO.selectFileNo();
		for(int i=0; i<attachList.size(); i++) {
			AttachVO attach=attachList.get(i);
			attach.setAtchFileNo(String.valueOf(seq));
			attachDAO.insertAttach(attach);
		}
		
	}
	
	
	
}
