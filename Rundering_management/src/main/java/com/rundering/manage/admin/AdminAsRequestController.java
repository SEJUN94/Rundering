package com.rundering.manage.admin;

import java.sql.SQLException;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.rundering.dto.AsRequestVO;
import com.rundering.dto.EmployeesVO;
import com.rundering.manage.Criteria;
import com.rundering.service.AsRequestServiceImpl;
import com.rundering.service.LaundryFixturesServiceImpl;

@Controller
@RequestMapping("/admin/asrequest")
public class AdminAsRequestController {
	@Autowired
	AsRequestServiceImpl asRequestService;
	
	@Autowired
	LaundryFixturesServiceImpl laundryFixturesService;

	// 리스트
	@RequestMapping(value = "/list")
	private ModelAndView asRequestList(Criteria cri, ModelAndView mnv) throws Exception {
		String url = "admin/asrequest/asrequest_list";

		Map<String, Object> dataMap = asRequestService.getAsRequestList(cri);
		mnv.addObject("dataMap", dataMap);
		mnv.setViewName(url);

		return mnv;
	}

	@RequestMapping(value = "/detail")
	private ModelAndView asRequestDetail(int asno, @RequestParam(defaultValue = "") String from,
			HttpServletRequest request, ModelAndView mnv, HttpSession session) throws SQLException {

		String url = "admin/asrequest/asrequest_detail";

		AsRequestVO asRequest = null;

		if (!from.equals("list")) {
			asRequest = asRequestService.getAsRequestModify(asno);
		} else {
			
			EmployeesVO employees = (EmployeesVO) session.getAttribute("loginEmployee");
			if (employees.getBranchCode().equals("000000")) {
				asRequest = asRequestService.getCheck(asno);
			}
			
			url = "redirect:/branch/asrequest/detail?asno=" + asno;
		}

		mnv.addObject("asRequest", asRequest);
		mnv.setViewName(url);

		return mnv;
	}
}