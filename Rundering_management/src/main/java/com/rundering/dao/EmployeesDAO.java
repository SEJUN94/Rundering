package com.rundering.dao;

import java.util.List;

import com.rundering.dto.EmployeesVO;

public interface EmployeesDAO {


	public EmployeesVO selectEmployeeByMno(String MemberNo) throws Exception;

	//사원등록
    public void employeeRegist(EmployeesVO ev) throws Exception;
    
    //고유번호를 이용한 사원 조회
    public EmployeesVO getEmployeeByNo(String memberno) throws Exception;
    
    //지점에 속한 배송사원 목록 가져오기 - by branchCode
    public List<EmployeesVO> selectDeliveryDepartmentEmployeesByBranchCode(String branchCode);
    public void employeeBranchRegist(EmployeesVO employee) throws Exception;
    public EmployeesVO selectEmployeeByMemberNo(String memberNo) throws Exception;
}
