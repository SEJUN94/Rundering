package com.rundering.dao;

import java.sql.SQLException;
import java.util.List;

import com.rundering.dto.AttachVO;

public interface AttachDAO {
	
	//atch_file_no_seq.nextval 가져오기
	public int selectFileNo() throws Exception;
	//파일정보 insert
	public void insertAttach(AttachVO attach) throws SQLException;
	public List<AttachVO> selectAttachVOByFileNo(String fileNo) throws Exception;
	public  void deleteAttchFileRemoveByFileNo(String fileNo) throws Exception;
	// 계약서 첨부 파일 수정
	public void updateToContractFile(AttachVO attach) throws Exception;
	//첨부파일 시퀀스 가져오기
	public int getAttachNoSeq(String atchFileNo)throws Exception;
	// 파일다운로드를 위한 해당 파일의 정보가져오기
	public AttachVO getAttachForDownload(AttachVO attach) throws Exception;
}
