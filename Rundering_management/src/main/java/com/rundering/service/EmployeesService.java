package com.rundering.service;

import com.rundering.dto.EmployeesVO;

public interface EmployeesService {
	public EmployeesVO getEmployee(String memberno) throws Exception;
	
	//사원등록
		public void employeeRegist(EmployeesVO ev) throws Exception;
}
