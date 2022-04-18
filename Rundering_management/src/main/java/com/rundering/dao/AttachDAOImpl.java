package com.rundering.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.rundering.dto.AttachVO;

public class AttachDAOImpl implements AttachDAO{
	SqlSession session;
	
	public void setSession(SqlSession session) {
		this.session = session;
	}
	@Override
	public int selectFileNo() throws Exception {
		int seq= session.selectOne("Attach-Mapper.selectFileNo");
		return seq;
	}

	@Override
	public void insertOrderGoodsAtach(AttachVO attach) throws Exception {
		session.update("Attach-Mapper.insertOrderGoodsAttach",attach);
	}
	
	@Override
	public List<AttachVO> selectAttachByArticlesCode(int atchFileNo) throws Exception {
		List<AttachVO> articles = session.selectList("Attach-Mapper.selectLaundryArticlesAttach", atchFileNo); 
		return articles;
	}
	

}