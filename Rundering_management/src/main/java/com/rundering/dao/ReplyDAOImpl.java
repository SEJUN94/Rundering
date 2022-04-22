package com.rundering.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.rundering.dto.ReplyVO;

public class ReplyDAOImpl implements ReplayDAO{
	SqlSession session;
	
	public void setSession(SqlSession session) {
		this.session = session;
	}
	
	@Override
	public List<ReplyVO> selectReplyByReplyNo(String replyNo) throws Exception{
		return session.selectList("Reply-Mapper.selectReplyByReplyNo", replyNo);
	}
	@Override
	public int selectReplySeq() throws Exception{
		return session.selectOne("Reply-Mapper.selectReplySeq");
	}
	@Override
	public void insertReplyByReplyVO(ReplyVO reply) throws Exception{
		 session.insert("Reply-Mapper.insertReplyByReplyVO",reply);
	}
	@Override
	public void insertReplyByReplyVOFirst(ReplyVO reply) throws Exception{
		session.insert("Reply-Mapper.insertReplyByReplyVOFirst");
	}
	
	
	
}
