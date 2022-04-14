package com.rundering.service;

import java.sql.SQLException;
import java.util.List;

import com.rundering.dao.AnonymousDAO;
import com.rundering.dto.AnonymousBoardVO;

public class AnonymousServiceImpl implements AnonymousService {

	private AnonymousDAO anonymousDAO;

	public void setAnonymousDAO(AnonymousDAO anonymousDAO) {
		this.anonymousDAO = anonymousDAO;
	}

	@Override
	public List<AnonymousBoardVO> getAnonymousList() throws SQLException {
		
		// 현재 page 번호에 맞게 리스트를 가져오기
		List<AnonymousBoardVO> anonymousList = anonymousDAO.selectSearchAnonymousList();

		// 전체 board 개수
		return anonymousList;
	}

	@Override
	public AnonymousBoardVO getAnonymous(int ano) throws SQLException {
		anonymousDAO.increaseViewCount(ano);

		AnonymousBoardVO anonymous = anonymousDAO.selectAnonymousByAno(ano);
		return anonymous;
	}

	@Override
	public AnonymousBoardVO getAnonymousModify(int ano) throws SQLException {
		AnonymousBoardVO anonymous = anonymousDAO.selectAnonymousByAno(ano);
		return anonymous;
	}

	@Override
	public void regist(AnonymousBoardVO anonymous) throws SQLException {
		anonymousDAO.insertAnonymous(anonymous);
	}

	@Override
	public void modify(AnonymousBoardVO anonymous) throws SQLException {
		anonymousDAO.updateAnonymous(anonymous);
	}

	@Override
	public void remove(int ano) throws SQLException {
		anonymousDAO.deleteAnonymous(ano);
	}

}
