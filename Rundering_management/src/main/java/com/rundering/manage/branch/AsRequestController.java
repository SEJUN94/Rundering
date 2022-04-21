package com.rundering.manage.branch;

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
@RequestMapping("/branch/asrequest")
public class AsRequestController {
	@Autowired
	AsRequestServiceImpl asRequestService;
	
	@Autowired
	LaundryFixturesServiceImpl laundryFixturesService;

	// 리스트
	@RequestMapping(value = "/list")
	private ModelAndView asRequestList(Criteria cri, ModelAndView mnv) throws Exception {
		String url = "branch/asrequest/asrequest_list";

		Map<String, Object> dataMap = asRequestService.getAsRequestList(cri);
		mnv.addObject("dataMap", dataMap);
		mnv.setViewName(url);

		return mnv;
	}

	@RequestMapping("/registForm")
	private String asRequestRegistForm() {

		String url = "branch/asrequest/asrequest_regist";

		return url;
	}

	@RequestMapping(value = "/regist")
	public String asRequestRegist(AsRequestVO asRequest, HttpServletRequest request, RedirectAttributes rttr)
			throws Exception {

		String url = "redirect:/branch/asrequest/list";

		asRequestService.regist(asRequest);
		asRequestService.getItemList(asRequest);
		
		rttr.addAttribute("getItemList", asRequest.getArticlesCode());
		rttr.addFlashAttribute("from", "regist");

		return url;
	}
	
	@RequestMapping("/modifyForm")
	public ModelAndView modifyForm(int asno, ModelAndView mnv) throws Exception {

		String url = "branch/asrequest/asrequest_modify";

		AsRequestVO asRequest = asRequestService.getAsRequestModify(asno);
	
		mnv.addObject("asRequest", asRequest);
		
		mnv.setViewName(url);

		return mnv;
	}

	@RequestMapping(value = "/modify", method = RequestMethod.POST)
	public String modifyPost(AsRequestVO asRequest, HttpServletRequest request, RedirectAttributes rttr) throws Exception {

		String url = "redirect:/branch/asrequest/detail";
		
		asRequestService.modify(asRequest);

		rttr.addAttribute("asno", asRequest.getAsno());
		rttr.addFlashAttribute("from", "modify");

		return url;
	}

	@RequestMapping(value = "/detail")
	private ModelAndView asRequestDetail(int asno, @RequestParam(defaultValue = "") String from,
			HttpServletRequest request, ModelAndView mnv, HttpSession session) throws SQLException {

		String url = "branch/asrequest/asrequest_detail";

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
	
	@RequestMapping(value = "/remove", method = RequestMethod.GET)
	public String remove(int asno, RedirectAttributes rttr) throws Exception {
		String url = "redirect:/branch/asrequest/detail";

		asRequestService.remove(asno);

		rttr.addFlashAttribute("from", "remove");
		rttr.addAttribute("asno", asno);

		return url;
	}


}