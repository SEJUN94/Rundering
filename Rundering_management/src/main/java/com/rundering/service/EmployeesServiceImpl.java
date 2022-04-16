package com.rundering.service;

import com.rundering.dao.EmployeesDAO;
import com.rundering.dao.EmployeesDAOImpl;
import com.rundering.dto.EmployeesVO;

public class EmployeesServiceImpl implements EmployeesService{
	EmployeesDAO employeesDAO;
	
	public void setEmployeesDAO(EmployeesDAO employeesDAO) {
		this.employeesDAO = employeesDAO;
	}
	
	@Override
	public EmployeesVO getEmployee(String memberNo) throws Exception {
		EmployeesVO employee= employeesDAO.selectEmployeeById(memberNo);
		return employee;
	}

	
}
