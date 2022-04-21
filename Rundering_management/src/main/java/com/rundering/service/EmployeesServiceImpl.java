package com.rundering.service;

import com.rundering.dao.EmployeesDAO;
import com.rundering.dto.EmployeesVO;

public class EmployeesServiceImpl implements EmployeesService{
	EmployeesDAO employeesDAO;
	
	public void setEmployeesDAO(EmployeesDAO employeesDAO) {
		this.employeesDAO = employeesDAO;
	}
	
	@Override
	public EmployeesVO getEmployee(String memberno) throws Exception {
		EmployeesVO employee= employeesDAO.selectEmployeeByMno(memberno);
		return employee;
	}
}
