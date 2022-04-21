package com.rundering.manage.branch;

import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.rundering.dto.EmployeesVO;
import com.rundering.manage.Criteria;
import com.rundering.service.LaundryOrderService;
import com.rundering.util.BranchCriteria;

@Controller
@RequestMapping("/branch/laundrysituatuion")
public class LaundrySituatuionController {
	@Autowired
	LaundryOrderService laundryOrderService;
	
	@RequestMapping("/list")
	private String situatuionList(Model model,BranchCriteria cri,HttpSession session) throws Exception {
		Map<String, Object> dataMap=null;
		String url = "branch/laundrysituatuion/situatuion_list";
		EmployeesVO emp = (EmployeesVO)session.getAttribute("loginEmployee");
		cri.setBranchCode(emp.getBranchCode());
		dataMap= laundryOrderService.laundryOrderList(cri);
		model.addAttribute("dataMap", dataMap);
		return url;

		
	}
	

	@RequestMapping("/modify")
	private String situatuonModify() {
		String url = "branch/laundrysituatuion/situatuion_modify";
		return url;
	}
	@RequestMapping("/detail")
	private String situatuonDetail() {
		String url = "branch/laundrysituatuion/situatuion_modify";
		return url; 
	}
}
