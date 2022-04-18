package com.rundering.dao;

import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;

import com.rundering.manage.Criteria;
import com.rundering.dto.SuggestBoardVO;

public class AnonymousDAOImpl implements AnonymousDAO {
	private SqlSession session;

	public void setSession(SqlSession session) {
		this.session = session;
	}

	@Override
	public List<SuggestBoardVO> selectSearchAnonymousList(Criteria cri) throws SQLException {
		
		int offset = cri.getStartRowNum();
		int limit = cri.getPerPageNum();
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		List<SuggestBoardVO> anonymousList = session.selectList("Anonymous-mapper.selectSearchAnonymousList", cri, rowBounds);
		return  anonymousList;
	}

	@Override
	public int selectSearchAnonymousListCount(Criteria cri) throws SQLException {
		return session.selectOne("Anonymous-mapper.selectSearchAnonymousListCount", cri);
	}

	@Override
	public SuggestBoardVO selectAnonymousByAno(int ano) throws SQLException {
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
	public void insertAnonymous(SuggestBoardVO AnonymousBoard) throws SQLException {
		session.update("Anonymous-mapper.insertAnonymous",AnonymousBoard);
	}

	@Override
	public void updateAnonymous(SuggestBoardVO AnonymousBoard) throws SQLException {
		session.update("Anonymous-mapper.updateAnonymous",AnonymousBoard);
	}

	@Override
	public void deleteAnonymous(int ano) throws SQLException {
		session.update("Anonymous-mapper.deleteAnonymous",ano);
	}

}
