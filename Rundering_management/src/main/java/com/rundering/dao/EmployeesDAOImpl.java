package com.rundering.dao;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;

import com.rundering.command.CustomerListCriteria;
import com.rundering.command.EmployeesListCriteria;
import com.rundering.dto.EmployeesVO;

public class EmployeesDAOImpl implements EmployeesDAO{
	SqlSession session;
	
	public void setSession(SqlSession session) {
		this.session = session;
	}
	@Override
	public EmployeesVO selectEmployeeByMno(String memberno) throws Exception {
		EmployeesVO employees = session.selectOne("Employees-Mapper.selectEmployeeByMno", memberno);
		return employees;
	}
	

	//사원등록
	@Override
	public void employeeRegist(EmployeesVO ev) throws Exception {
		session.update("Employees-Mapper.employeeRegist",ev);
	}
	
	//고유번호를 이용한 사원 조회
	@Override
	public EmployeesVO getEmployeeByNo(String memberno) throws Exception {
		
		EmployeesVO ev = session.selectOne("Employees-Mapper.getEmployeeByNo", memberno);
		
		return ev;
	}
	
	 //지점에 속한 배송사원 목록 가져오기 - by branchCode
	@Override
	public List<EmployeesVO> selectDeliveryDepartmentEmployeesByBranchCode(String branchCode) {
		List<EmployeesVO> deliveryDepartmentEmployees = session.selectList("Employees-Mapper.selectDeliveryDepartmentEmployeesByBranchCode",branchCode);
		return deliveryDepartmentEmployees;
	}
	
	//사원리스트 조회
	@Override
	public List<EmployeesVO> selectEmployeeList(EmployeesListCriteria cri) throws Exception {
		int offset = cri.getStartRowNum();
		int limit = cri.getPerPageNum();
		RowBounds rowBounds = new RowBounds(offset,limit);
		
		List<EmployeesVO> emplyeesList = session.selectList("Employees-Mapper.selectSearchEmployeeList",cri,rowBounds);
				
		return emplyeesList;
	}
	
	//일반 리스트 전체 개수
	@Override
	public int selectEmployeeListCount() throws Exception {
		int totalCount = session.selectOne("Employees-Mapper.selectEmployeeListCount");
		return totalCount;
	}
	
	//검색 결과의 전체 리스트 개수
	@Override
	public int selectEmployeeListCount(EmployeesListCriteria cri) throws Exception {
		int totalCount = session.selectOne("Employees-Mapper.selectSearchEmployeeListCount",cri);
		return totalCount;
	}
	
 
	
}
