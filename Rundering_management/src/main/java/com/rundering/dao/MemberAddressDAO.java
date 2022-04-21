package com.rundering.dao;
​
import com.rundering.dto.MemberAddressVO;
​
public interface MemberAddressDAO {
	
	// 주소지 등록
	public void addRegist(MemberAddressVO memberAdd) throws Exception;
	
}