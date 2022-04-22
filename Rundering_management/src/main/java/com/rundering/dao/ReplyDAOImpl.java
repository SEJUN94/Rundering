package com.rundering.dao;

import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.rundering.dto.ReplyVO;

public class ReplyDAOImpl implements ReplyDAO {

	private SqlSession session;
		
	public void setSession(SqlSession session) {
		this.session = session;
	}

	@Override
	public void insertReply(ReplyVO reply) throws SQLException {
		session.update("Reply-Mapper.insertReply", reply);
	}

	@Override
	public void updateReply(ReplyVO reply) throws SQLException {
		session.update("Reply-Mapper.updateReply", reply);
	}

	@Override
	public void deleteReply(int replyno) throws SQLException {
		session.update("Reply-Mapper.deleteReply", replyno);
	}

	@Override
	public int selectReplySeqNextValue() throws SQLException {
		int seq_num=session.update("Reply-Mapper.selectReplySeqNextValue");
		return seq_num;
	}

	@Override
	public List<ReplyVO> selectReplyListPage(int replyno) throws SQLException {
		List<ReplyVO> replyList=session.selectList("Reply-Mapper.selectReplyList",replyno);
		return replyList;
	}
	

	
}
