package com.rundering.service;

import java.util.List;

import com.rundering.dao.ComCodeDAO;
import com.rundering.dao.EmployeesDAO;
import com.rundering.dto.ComCodeVO;
import com.rundering.dto.EmployeesVO;

public class EmployeesServiceImpl implements EmployeesService{
	EmployeesDAO employeesDAO;
	
	public void setEmployeesDAO(EmployeesDAO employeesDAO) {
		this.employeesDAO = employeesDAO;
	}
	
	ComCodeDAO comCodeDAO;
	
	public void setComCodeDAO(ComCodeDAO comCodeDAO) {
		this.comCodeDAO = comCodeDAO;
	}
	
	@Override
	public EmployeesVO getEmployee(String memberno) throws Exception {
		EmployeesVO employee= employeesDAO.selectEmployeeByMno(memberno);
		return employee;
	}
	//사원등록
	@Override
	public void employeeRegist(EmployeesVO ev) throws Exception {
		employeesDAO.employeeRegist(ev);
		
	}
	
	//전체 부서 가져오기
	@Override
	public List<ComCodeVO> getDepartment() throws Exception {

		List<ComCodeVO> cvList = comCodeDAO.getDepartment();
		
		return cvList;
	}
	
}
