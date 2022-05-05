package com.rundering.dao;

import java.sql.SQLException;
import java.util.List;

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
	
	//파일첨부 번호로 저장된 파일 정보 가져오기
	@Override
	public List<AttachVO> selectAttachVOByFileNo(String fileNo)  throws Exception{
		return session.selectList("Attach-Mapper.selectAttachVOByFileNo", fileNo);
	}
	@Override
	public void deleteAttchFileRemoveByFileNo(String fileNo) throws Exception{
		session.delete("Attach-Mapper.deleteAttchFileRemoveByFileNo", fileNo);
	}

}
