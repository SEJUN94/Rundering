package com.rundering.service;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.rundering.command.Criteria;
import com.rundering.command.PageMaker;
import com.rundering.dao.SuggestDAO;
import com.rundering.dto.SuggestVO;

public class SuggestServiceImpl implements SuggestService {

	private SuggestDAO suggestDAO;

	public void setSuggestDAO(SuggestDAO suggestDAO) {
		this.suggestDAO = suggestDAO;
	}

	@Override
	public Map<String, Object> getSuggestList(Criteria cri) throws SQLException {

		Map<String, Object> dataMap = new HashMap<String, Object>();

		// 현재 page 번호에 맞게 리스트를 가져오기
		List<SuggestVO> suggestList = suggestDAO.selectSearchSuggestList(cri);

		// 전체 board 개수
		int totalCount = suggestDAO.selectSearchSuggestListCount(cri);

		// PageMaker 생성.
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(totalCount);

		dataMap.put("suggestList", suggestList);
		dataMap.put("pageMaker", pageMaker);

		return dataMap;
	}

	@Override
	public SuggestVO getSuggest(int sno) throws SQLException {
		suggestDAO.increaseViewCount(sno);

		SuggestVO suggest = suggestDAO.selectSuggestBySno(sno);
		return suggest;
	}

	@Override
	public SuggestVO getCheck(int sno) throws SQLException {
		suggestDAO.checkSuggest(sno);
		
		SuggestVO suggest = suggestDAO.selectSuggestBySno(sno);
		return suggest;
	}

	@Override
	public SuggestVO getSuggestModify(int sno) throws SQLException {
		SuggestVO suggest = suggestDAO.selectSuggestBySno(sno);
		return suggest;
	}

	@Override
	public void regist(SuggestVO suggest) throws SQLException {
		suggestDAO.insertSuggest(suggest);
	}

	@Override
	public void modify(SuggestVO suggest) throws SQLException {
		suggestDAO.updateSuggest(suggest);
	}

	@Override
	public void remove(int sno) throws SQLException {
		suggestDAO.deleteSuggest(sno);
	}
}
