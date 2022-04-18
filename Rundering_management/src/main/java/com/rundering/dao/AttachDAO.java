package com.rundering.dao;

import java.util.List;

import com.rundering.dto.AttachVO;

public interface AttachDAO {
	public void insertOrderGoodsAtach(AttachVO attach) throws Exception;
	
	public int selectFileNo() throws Exception;
	
	public String selectAttachNameByAtchFileNo(int atchFileNo) throws Exception;
}
