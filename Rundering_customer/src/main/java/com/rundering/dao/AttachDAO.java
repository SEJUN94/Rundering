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
	
}
