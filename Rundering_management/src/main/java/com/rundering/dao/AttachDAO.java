package com.rundering.dao;

import java.sql.SQLException;
import java.util.List;

import com.rundering.dto.AttachVO;

public interface AttachDAO {
	public void insertOrderGoodsAtach(AttachVO attach) throws Exception;
	
	public int selectFileNo() throws Exception;
	
	public List<AttachVO> selectAttachByArticlesCode(int atchFileNo) throws Exception;
	public void insertAttach(AttachVO attach) throws SQLException;
	public List<AttachVO> selectAttachVOByFileNo(String fileNo) throws Exception;
	public  void deleteAttchFileRemoveByFileNo(String fileNo) throws Exception;
	

}


