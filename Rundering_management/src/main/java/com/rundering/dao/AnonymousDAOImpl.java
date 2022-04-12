package com.rundering.dao;

import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.jsp.command.Criteria;
import com.rundering.dto.AnonymousVO;

public class AnonymousDAOImpl implements AnonymousDAO{
	
	private SqlSession session;
	private AnonymousDAO anonymousDAO;
	
	public void setSession(SqlSession session) {
		this.session = session;
	}
	
	public void setAnonymousDAO(AnonymousDAO anonymousDAO) {
		this.anonymousDAO = anonymousDAO;
	}

	@Override
	public List<AnonymousVO> AnonymousList(Criteria cri) throws SQLException {
		return anonymousDAO.selectSearchAnonymousList(session, cri);
	}

	@Override
	public int AnonymousListCount(Criteria cri) throws SQLException {
		return anonymousDAO.selectSearchAnonymousListCount(session, cri);
	}

	@Override
	public AnonymousVO AnonymousByAnonymousno(int ano) throws SQLException {
		return anonymousDAO.selectAnonymousByAnonymousno(session, ano);
	}

	@Override
	public void increaseViewCount(int ano) throws SQLException {
		anonymousDAO.increaseViewCount(session, ano);
	}

	@Override
	public int selectAnonymousSequenceNextValue() throws SQLException {
		return anonymousDAO.selectAnonymousSequenceNextValue(session);
	}

	@Override
	public void insertAnonymous(AnonymousVO Anonymous) throws SQLException {
		anonymousDAO.insertAnonymous(session, Anonymous);
	}

	@Override
	public void updateAnonymous(AnonymousVO Anonymous) throws SQLException {
		anonymousDAO.updateAnonymous(session, Anonymous);
		
	}

	@Override
	public void deleteAnonymous(int ano) throws SQLException {
		anonymousDAO.deleteAnonymous(session, ano);
	}
	
	
	
	
	
	
	
	
	
	
	
}
