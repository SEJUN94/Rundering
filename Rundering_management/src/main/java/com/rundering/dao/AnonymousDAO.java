package com.rundering.dao;

import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.jsp.command.Criteria;
import com.rundering.dto.AnonymousVO;

public interface AnonymousDAO {
	
	List<AnonymousVO> AnonymousList(SqlSession session, Criteria cri) throws SQLException;

	int AnonymousListCount(SqlSession session,Criteria cri) throws SQLException;

	AnonymousVO AnonymousByAnonymousno(SqlSession session, int ano) throws SQLException;

	void increaseViewCount(SqlSession session, int ano) throws SQLException;

	int selectAnonymousSequenceNextValue(SqlSession session) throws SQLException;

	void insertAnonymous(SqlSession session, AnonymousVO anonymous) throws SQLException;

	void updateAnonymous(SqlSession session, AnonymousVO anonymous) throws SQLException;

	void deleteAnonymous(SqlSession session, int ano) throws SQLException;

} 
