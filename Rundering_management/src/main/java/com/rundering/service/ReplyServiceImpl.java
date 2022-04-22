package com.rundering.service;

import java.sql.SQLException;
import java.util.List;

import com.rundering.dao.MemberDAO;
import com.rundering.dao.ReplyDAO;
import com.rundering.dto.ReplyVO;

public class ReplyServiceImpl implements ReplyService{
	
	private ReplyDAO replyDAO;

	public void setReplyDAO(ReplyDAO replyDAO) {
		this.replyDAO = replyDAO;
	}

	private MemberDAO MemberDAO;
	public void setMemberDAO(MemberDAO MemberDAO) {
		this.MemberDAO = MemberDAO;
	}
	
	@Override
	public List<ReplyVO> getReplyList(int replyno)throws Exception {

		List<ReplyVO> replyList = replyDAO.selectReplyListPage(replyno);

		if(replyList!=null)for(ReplyVO reply : replyList) {
			MemberDAO.selectMemberById(reply.getMemberno());
		}

		return replyList;
	}

	@Override
	public void registReply(ReplyVO reply) throws SQLException {
		int replyno = replyDAO.selectReplySeqNextValue();
		reply.setReplyno(replyno);

		replyDAO.insertReply(reply);
	}

	@Override
	public void modifyReply(ReplyVO reply) throws SQLException {
		replyDAO.updateReply(reply);
	}

	@Override
	public void removeReply(int replyno) throws SQLException {
		replyDAO.deleteReply(replyno);
	}

	
	

}
