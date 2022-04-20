package com.rundering.manage.branch;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.rundering.dto.AsRequestVO;
import com.rundering.manage.Criteria;
import com.rundering.service.AsRequestServiceImpl;

@Controller
@RequestMapping("/branch/asrequest")
public class AsRequestController {
	@Autowired
	AsRequestServiceImpl asRequestService;
	
	//리스트
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

		rttr.addFlashAttribute("from", "regist");

		return url;
	}
	
}