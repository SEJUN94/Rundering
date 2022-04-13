package com.rundering.dao;

import java.sql.SQLException;
import java.util.List;

import com.jsp.command.Criteria;
import com.rundering.dto.AnonymousBoardVO;

public interface AnonymousDAO {

	List<AnonymousBoardVO> selectSearchAnonymousList() throws SQLException;

	int selectSearchAnonymousListCount(Criteria cri) throws SQLException;

	AnonymousBoardVO selectAnonymousByAno(int ano) throws SQLException;

	void increaseViewCount(int ano) throws SQLException;

	int selectAnonymousSequenceNextValue() throws SQLException;

	void insertAnonymous(AnonymousBoardVO AnonymousBoard) throws SQLException;

	void updateAnonymous(AnonymousBoardVO AnonymousBoard) throws SQLException;

	void deleteAnonymous(int ano) throws SQLException;

}
