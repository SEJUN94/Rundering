package com.rundering.manage.admin;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.rundering.dto.BranchVO;
import com.rundering.dto.EmployeesVO;
import com.rundering.dto.MemberVO;
import com.rundering.service.BranchService;
import com.rundering.service.EmployeesService;
import com.rundering.service.MemberService;
import com.rundering.util.AppCriteria;

@Controller
@RequestMapping("admin/employeeapplication")
public class EmployeesApplicationController {
	
	@Autowired
	MemberService memberService;
	
	@Autowired
	EmployeesService employeesService;
	
	@Autowired
	BranchService branchService;
	
	@RequestMapping("/main")
	public ModelAndView employeeapplication(HttpServletRequest request,ModelAndView mnv,AppCriteria cri) throws Exception {
		String url = "admin/employee/employeeapplication_main";
		
		HttpSession session = request.getSession();
		EmployeesVO ev = (EmployeesVO) session.getAttribute("loginEmployee");
		
		cri.setPassword(ev.getBranchCode());
		
		List<BranchVO> branchList = branchService.getBranchList();
		
		Map<String, Object> dataMap = memberService.getEmplAppList(cri);
		
		mnv.addObject("branchList",branchList);
		mnv.addObject("dataMap", dataMap);
		mnv.setViewName(url);
		
		return mnv;
	}
	
	@RequestMapping("/detail")
	public ResponseEntity<MemberVO> detail(String memberNo) throws Exception {
		
		ResponseEntity<MemberVO> entity = null;
		System.out.println(memberNo+"dsadsadasdasdasdasds");
		
		try {
			MemberVO mv = memberService.getEmpAppinfo(memberNo);
			if (mv != null) {
				entity = new ResponseEntity<MemberVO>(mv, HttpStatus.OK);
			} else {
				System.out.println("실행 안됨!!!");
			}
		} catch (SQLException e) {
		entity = new ResponseEntity<MemberVO>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
		
		
		return entity;
		
	}
	
	
	
	
	@RequestMapping("/regist")
	public String regeist(MemberVO mv, EmployeesVO ev) throws Exception {
		String url = "redirect:/admin/employeeapplication/main";
		
		employeesService.employeeRegist(ev);
		
		
		
		return url;
	}
	
	
}
