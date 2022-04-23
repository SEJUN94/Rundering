package com.rundering.manage.admin;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.rundering.manage.Criteria;
import com.rundering.service.MemberService;

@Controller
@RequestMapping("/admin/customer")
public class CustomerController {
	
	@Autowired
	MemberService memberService;

	@RequestMapping("/list")
	public ModelAndView customerList(Criteria cri, ModelAndView mnv) {
		String url = "admin/customer/customer_list";
		Map<String, Object> dataMap = null;
		try {
			dataMap = memberService.getMemberList(cri);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		mnv.addObject("dataMap", dataMap);
		mnv.setViewName(url);
		return mnv;
	}

	@RequestMapping("/dormant")
	public String dormant_List() {
		return "admin/customer/dormant_account_list";
	}
	@RequestMapping("/dormant_detail")
	public String dormant_Detail() {
		return "admin/customer/dormant_detail";
	}
	@RequestMapping("/secession")
	public String secession_List() {
		return "admin/customer/secession_account_list";
	}
	@RequestMapping("/secession_detail")
	public String secession_Detail() {
		return "admin/customer/secession_detail";
	}

}
