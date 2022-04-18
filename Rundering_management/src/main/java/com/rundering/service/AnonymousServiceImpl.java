package com.rundering.service;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.rundering.dao.AnonymousDAO;
import com.rundering.dto.SuggestBoardVO;
import com.rundering.manage.Criteria;
import com.rundering.manage.PageMaker;

public class AnonymousServiceImpl implements AnonymousService {

	private AnonymousDAO anonymousDAO;

	public void setAnonymousDAO(AnonymousDAO anonymousDAO) {
		this.anonymousDAO = anonymousDAO;
	}

	@Override
	public Map<String, Object> getAnonymousList(Criteria cri) throws SQLException {
		
		Map<String, Object> dataMap = new HashMap<String, Object>();
		
		// 현재 page 번호에 맞게 리스트를 가져오기
		List<SuggestBoardVO> anonymousList = anonymousDAO.selectSearchAnonymousList(cri);

		// 전체 board 개수
		int totalCount = anonymousDAO.selectSearchAnonymousListCount(cri);
		
		// PageMaker 생성.
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(totalCount);

		dataMap.put("anonymousList", anonymousList);
		dataMap.put("pageMaker", pageMaker);
		
		return dataMap;
	}

	@Override
	public SuggestBoardVO getAnonymous(int ano) throws SQLException {
		anonymousDAO.increaseViewCount(ano);

		SuggestBoardVO anonymous = anonymousDAO.selectAnonymousByAno(ano);
		return anonymous;
	}

	@Override
	public SuggestBoardVO getAnonymousModify(int ano) throws SQLException {
		SuggestBoardVO anonymous = anonymousDAO.selectAnonymousByAno(ano);
		return anonymous;
	}

	@Override
	public void regist(SuggestBoardVO anonymous) throws SQLException {
		anonymousDAO.insertAnonymous(anonymous);
	}

	@Override
	public void modify(SuggestBoardVO anonymous) throws SQLException {
		anonymousDAO.updateAnonymous(anonymous);
	}

	@Override
	public void remove(int ano) throws SQLException {
		anonymousDAO.deleteAnonymous(ano);
	}


}
