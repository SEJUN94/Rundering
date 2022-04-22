package com.rundering.manage.admin;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.rundering.dto.EmployeesVO;
import com.rundering.dto.MemberVO;
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
	
	@RequestMapping("/main")
	public ModelAndView employeeapplication(HttpServletRequest request,ModelAndView mnv,AppCriteria cri) throws Exception {
		String url = "admin/employee/employeeapplication_main";
		
		HttpSession session = request.getSession();
		EmployeesVO ev = (EmployeesVO) session.getAttribute("loginEmployee");
		
		cri.setPassword(ev.getBranchCode());
		
		Map<String, Object> dataMap = memberService.getEmplAppList(cri);
		
		mnv.addObject("dataMap", dataMap);
		mnv.setViewName(url);
		
		return mnv;
	}
	
	@RequestMapping("/detail")
	public ModelAndView detail() throws Exception {
		
		
		return null;
		
	}
	
	
	
	
	@RequestMapping("/regist")
	public String regeist(MemberVO mv, EmployeesVO ev) throws Exception {
		String url = "redirect:/admin/employeeapplication/main";
		
		employeesService.employeeRegist(ev);
		
		
		
		return url;
	}
	
	
}
