package com.rundering.service;

import java.util.List;

import com.rundering.dto.ComCodeVO;
import com.rundering.dto.EmployeesVO;

public interface EmployeesService {
	public EmployeesVO getEmployee(String memberno) throws Exception;
	
	//사원등록
	public void employeeRegist(EmployeesVO ev) throws Exception;
	
	//전체 부서 가져오기
	public List<ComCodeVO> getDepartment() throws Exception;
}
