package com.rundering.dao;

import java.util.ArrayList;
import java.util.List;

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
	public void employeeRegist(EmployeesVO ev) throws Exception {
		session.update("Employees-Mapper.employeeRegist",ev);
	}
	
	//고유번호를 이용한 사원 조회
	@Override
	public EmployeesVO getEmployeeByNo(String memberno) throws Exception {
		
		EmployeesVO ev = session.selectOne("Employees-Mapper.getEmployeeByNo", memberno);
		
		return ev;
	}
	
	 //지점에 속한 배송사원 목록 가져오기 - by branchCode
	@Override
	public List<EmployeesVO> selectDeliveryDepartmentEmployeesByBranchCode(String branchCode) {
		List<EmployeesVO> deliveryDepartmentEmployees = session.selectList("Employees-Mapper.selectDeliveryDepartmentEmployeesByBranchCode",branchCode);
		return deliveryDepartmentEmployees;
	}
	@Override
	public void employeeBranchRegist(EmployeesVO employee) throws Exception {
		session.insert("Employees-Mapper.employeeBranchRegist", employee);
		
	}
	
 
	
}
