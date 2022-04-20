package com.rundering.dao;

import java.util.List;

import com.rundering.dto.AttachVO;

public interface AttachDAO {
	
	//atch_file_no_seq.nextval 가져오기
	public int selectFileNo() throws Exception;
	
}
