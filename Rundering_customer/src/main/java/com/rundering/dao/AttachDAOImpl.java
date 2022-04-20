package com.rundering.dao;

import java.sql.SQLException;

import org.apache.ibatis.session.SqlSession;

import com.rundering.dto.AttachVO;

public class AttachDAOImpl implements AttachDAO{
	SqlSession session;
	
	public void setSession(SqlSession session) {
		this.session = session;
	}
	
	//atch_file_no_seq.nextval
	@Override
	public int selectFileNo() throws Exception {
		int atchFileNoSeq= session.selectOne("Attach-Mapper.selectFileNo");
		return atchFileNoSeq;
	}

	@Override
	public void insertAttach(AttachVO attach) throws SQLException {
		session.update("Attach-Mapper.insertAttach",attach);
	}

	

}
