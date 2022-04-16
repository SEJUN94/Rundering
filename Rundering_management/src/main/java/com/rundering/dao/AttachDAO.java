package com.rundering.dao;

import com.rundering.dto.AttachVO;

public interface AttachDAO {
	public void insertOrderGoodsAtach(AttachVO attach) throws Exception;
	public int selectFileNo() throws Exception;
}
