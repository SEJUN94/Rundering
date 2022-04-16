package com.rundering.service;

import java.sql.SQLException;

import com.rundering.dto.MemberAddressVO;

public interface MemberAddressService {

	// 주소지 등록
	public void memberAddressRegist(MemberAddressVO memberAdd) throws Exception;
	
	//기본주소지 조회 - memberNo로
	public MemberAddressVO getDefaultMemberAddress(String memberNo) throws SQLException;

	
}
