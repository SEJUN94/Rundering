package com.rundering.dao;

import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.jsp.command.Criteria;
import com.rundering.dto.AnonymousBoardVO;

public class AnonymousDAOImpl implements AnonymousDAO {
	private SqlSession session;

	public void setSession(SqlSession session) {
		this.session = session;
	}

	@Override
	public List<AnonymousBoardVO> selectSearchAnonymousList() throws SQLException {
		return session.selectList("Anonymous-mapper.selectSearchAnonymousList");
	}

	@Override
	public int selectSearchAnonymousListCount(Criteria cri) throws SQLException {
		return session.selectOne("Anonymous-mapper.selectSearchAnonymousListCount", cri);
	}

	@Override
	public AnonymousBoardVO selectAnonymousByAno(int ano) throws SQLException {
		return session.selectOne("Anonymous-mapper.selectAnonymousByAno", ano);
	}

	@Override
	public void increaseViewCount(int ano) throws SQLException {
		session.update("Anonymous-mapper.increaseViewCount", ano);
	}

	@Override
	public int selectAnonymousSequenceNextValue() throws SQLException {
		return session.selectOne("Anonymous-mapper.selectAnonymousSequenceNextValue");
	}

	@Override
	public void insertAnonymous(AnonymousBoardVO AnonymousBoard) throws SQLException {
		session.update("Anonymous-mapper.insertAnonymous",AnonymousBoard);
	}

	@Override
	public void updateAnonymous(AnonymousBoardVO AnonymousBoard) throws SQLException {
		session.update("Anonymous-mapper.updateAnonymous",AnonymousBoard);
	}

	@Override
	public void deleteAnonymous(int ano) throws SQLException {
		session.update("Anonymous-mapper.deleteAnonymous",ano);
	}

}
