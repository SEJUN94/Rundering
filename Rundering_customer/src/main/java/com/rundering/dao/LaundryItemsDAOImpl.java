package com.rundering.dao;

import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.rundering.dto.LaundryItemsVO;

public class LaundryItemsDAOImpl implements LaundryItemsDAO {

	private SqlSession session;
	public void setSession(SqlSession session) {
		this.session = session;
	}

	// 의류 시퀀스
	@Override
	public String SelectClothingSequenceNextValue() throws SQLException{
		return session.selectOne("LaundryItems-Mapper.selectClothingSequenceNextValue");
	}
	// 침구 시퀀스
	@Override
	public String SelectBeddingSequenceNextValue() throws SQLException{
		return session.selectOne("LaundryItems-Mapper.selectBeddingSequenceNextValue");
	}
	// 신발 시퀀스
	@Override
	public String SelectShoesSequenceNextValue() throws SQLException{
		return session.selectOne("LaundryItems-Mapper.selectShoesSequenceNextValue");
	}

	// 세탁품목 등록
	@Override
	public void insertLaundryItems(LaundryItemsVO laundryItems) throws SQLException{
		session.update("LaundryItems-Mapper.insertLaundryItems", laundryItems);
	}
	
	// 세탁품목 조회 - BylaundryItemsCode
	@Override
	public LaundryItemsVO selectLaundryItemsBylaundryItemsCode(String laundryItemsCode) throws SQLException {
		return session.selectOne("LaundryItems-Mapper.selectLaundryItemsBylaundryItemsCode",laundryItemsCode);
	}
	
	// 세탁품목 의류 목록조회 - 주문화면에서 출력할 것
	@Override
	public List<LaundryItemsVO> selectClothingList() throws SQLException {
		return session.selectList("LaundryItems-Mapper.selectClothingList");
	}
	// 세탁품목 침구 목록조회 - 주문화면에서 출력할 것
	@Override
	public List<LaundryItemsVO> selectBeddingList() throws SQLException {
		return session.selectList("LaundryItems-Mapper.selectBeddingList");
	}
	// 세탁품목 신발 목록조회 - 주문화면에서 출력할 것
	@Override
	public List<LaundryItemsVO> selectShoesList() throws SQLException {
		return session.selectList("LaundryItems-Mapper.selectShoesList");
	}


}
