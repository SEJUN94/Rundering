package com.rundering.dao;

import java.sql.SQLException;
import java.util.List;

import com.rundering.dto.MemberAddressVO;

public interface MemberAddressDAO {

	// 주소지 등록
	public void addRegist(MemberAddressVO memberAdd) throws Exception;
	
	//기본 주소지 조회 - memberNo
	public MemberAddressVO selectDefaultMemberAddressByMemberNo(String memberNo) throws SQLException;
	
	//주소지 목록 조회 - memberNo
	public List<MemberAddressVO> selectMemberAddressListByMemberNo(String memberNo);

}
