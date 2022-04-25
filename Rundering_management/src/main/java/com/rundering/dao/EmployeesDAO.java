package com.rundering.dao;

import com.rundering.dto.EmployeesVO;

public interface EmployeesDAO {


	public EmployeesVO selectEmployeeByMno(String MemberNo) throws Exception;

	//사원등록
    public int employeeRegist(EmployeesVO ev) throws Exception;
    
    //고유번호를 이용한 사원 조회
    public EmployeesVO getEmployeeByNo(String memberno) throws Exception;
    
}
