package com.rundering.dao;

import java.sql.SQLException;
import java.util.List;

import com.rundering.dto.LaundryItemsVO;

public interface LaundryItemsDAO {
	
	//의류 시퀀스
	public String SelectClothingSequenceNextValue() throws SQLException;
	//침구 시퀀스
	public String SelectBeddingSequenceNextValue() throws SQLException;
	//신발 시퀀스
	public String SelectShoesSequenceNextValue() throws SQLException;
	
	//세탁품목 등록
	public void insertLaundryItems(LaundryItemsVO laundryItems) throws SQLException;
	//세탁품목 목록조회 - 의류만
	public List<LaundryItemsVO> selectClothingList() throws SQLException;
	//세탁품목 목록조회 - 침구만
	public List<LaundryItemsVO> selectBeddingList() throws SQLException;
	//세탁품목 목록조회 - 신발만
	public List<LaundryItemsVO> selectShoesList() throws SQLException;
}