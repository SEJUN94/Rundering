package com.rundering.dao;

import org.apache.ibatis.session.SqlSession;

import com.rundering.dto.EmployeesVO;
import com.rundering.dto.MemberVO;

public class EmployeesDAOImpl implements EmployeesDAO{
	SqlSession session;
	
	public void setSession(SqlSession session) {
		this.session = session;
	}
	@Override
	public EmployeesVO selectEmployeeById(String MemberNo) throws Exception {
		EmployeesVO employees = session.selectOne("Employees-Mapper.selectEmployeeById", MemberNo);
		return employees;
	}
 
	
}
