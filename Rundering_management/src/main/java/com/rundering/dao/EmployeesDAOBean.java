package com.rundering.dao;

import com.rundering.dto.MemberVO;

public interface EmployeesDAOBean {
	public MemberVO selectMemberById(String id) throws Exception;

}
