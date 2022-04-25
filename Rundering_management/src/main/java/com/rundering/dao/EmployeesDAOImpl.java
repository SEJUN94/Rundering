package com.rundering.dao;

import org.apache.ibatis.session.SqlSession;

import com.rundering.dto.EmployeesVO;

public class EmployeesDAOImpl implements EmployeesDAO{
	SqlSession session;
	
	public void setSession(SqlSession session) {
		this.session = session;
	}
	@Override
	public EmployeesVO selectEmployeeByMno(String memberno) throws Exception {
		EmployeesVO employees = session.selectOne("Employees-Mapper.selectEmployeeByMno", memberno);
		return employees;
	}
	

	//사원등록
	@Override
	public int employeeRegist(EmployeesVO ev) throws Exception {
		return session.update("Employees-Mapper.employeeRegist",ev);
	}
	
	//고유번호를 이용한 사원 조회
	@Override
	public EmployeesVO getEmployeeByNo(String memberno) throws Exception {
		
		EmployeesVO ev = session.selectOne("Employees-Mapper.getEmployeeByNo", memberno);
		
		return ev;
	}
	
 
	
}
