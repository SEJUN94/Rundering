package com.rundering.service;

import com.rundering.dto.EmployeesVO;

public interface EmployeesService {
	public EmployeesVO getEmployee(String memberNo) throws Exception;
}
