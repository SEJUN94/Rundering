package com.rundering.dao;

import com.rundering.dto.EmployeesVO;

public interface EmployeesDAO {


	public EmployeesVO selectEmployeeById(String MemberNo) throws Exception;
	
	//사원등록
	public void employeeRegist(EmployeesVO ev) throws Exception;
	
	


}
