package com.rundering.dao;

import java.sql.SQLException;

import com.rundering.dto.MemberAddressVO;

public interface MemberAddressDAO {

	// 주소지 등록
	public void addRegist(MemberAddressVO memberAdd) throws Exception;
	
	//주소지 조회 - 
	public MemberAddressVO selectDefaultMemberAddressByMemberNo(String memberNo) throws SQLException;

}
