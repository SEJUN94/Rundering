package com.rundering.dao;

import com.rundering.dto.EmployeesVO;
import com.rundering.dto.MemberVO;

public interface EmployeesDAO {


	public EmployeesVO selectEmployeeByMno(String MemberNo) throws Exception;

	   //사원등록
    public void employeeRegist(EmployeesVO ev) throws Exception;
}
