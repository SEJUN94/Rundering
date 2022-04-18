package com.rundering.dao;

import java.sql.SQLException;
import java.util.List;

import com.rundering.manage.Criteria;
import com.rundering.dto.SuggestBoardVO;

public interface AnonymousDAO {

	List<SuggestBoardVO> selectSearchAnonymousList(Criteria cri) throws SQLException;

	int selectSearchAnonymousListCount(Criteria cri) throws SQLException;

	SuggestBoardVO selectAnonymousByAno(int ano) throws SQLException;

	void increaseViewCount(int ano) throws SQLException;

	int selectAnonymousSequenceNextValue() throws SQLException;

	void insertAnonymous(SuggestBoardVO AnonymousBoard) throws SQLException;

	void updateAnonymous(SuggestBoardVO AnonymousBoard) throws SQLException;

	void deleteAnonymous(int ano) throws SQLException;

}
