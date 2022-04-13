package com.rundering.dao;

import org.apache.ibatis.session.SqlSession;

import com.rundering.dto.LaundryItemsVO;

public class LaundryItemsDAOImpl implements LaundryItemsDAO {

	private SqlSession session;
	public void setSession(SqlSession session) {
		this.session = session;
	}

	// 의류 시퀀스
	@Override
	public String SelectClothingSequenceNextValue() {
		return session.selectOne("LaundryItems-Mapper.selectClothingSequenceNextValue");
	}
	// 침구 시퀀스
	@Override
	public String SelectBeddingSequenceNextValue() {
		return session.selectOne("LaundryItems-Mapper.selectBeddingSequenceNextValue");
	}
	// 신발 시퀀스
	@Override
	public String SelectShoesSequenceNextValue() {
		return session.selectOne("LaundryItems-Mapper.selectShoesSequenceNextValue");
	}

	// 세탁품목 등록
	@Override
	public void insertLaundryItems(LaundryItemsVO laundryItems) {
		session.update("LaundryItems-Mapper.insertLaundryItems", laundryItems);
	}

}
