package com.rundering.manage.admin;

import java.sql.SQLException;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.rundering.command.Criteria;
import com.rundering.dto.SuggestVO;
import com.rundering.service.SuggestServiceImpl;

@Controller
@RequestMapping("/admin/suggest")
public class AdminSuggestController {
	
	@Autowired
	SuggestServiceImpl suggestService;

	@RequestMapping(value = "/list")
	private ModelAndView suggestList(Criteria cri, ModelAndView mnv) throws Exception {
		String url = "admin/suggest/suggest_list";

		Map<String, Object> dataMap = suggestService.getSuggestList(cri);
		mnv.addObject("dataMap", dataMap);
		mnv.setViewName(url);

		return mnv;
	}
	
	@RequestMapping(value = "/detail")
	private ModelAndView suggestDetail(int sno, @RequestParam(defaultValue = "") String from,
			HttpServletRequest request, ModelAndView mnv) throws SQLException {

		String url = "admin/suggest/suggest_detail";

		SuggestVO suggest = null;

		if (!from.equals("list")) {
			suggest = suggestService.getSuggestModify(sno);
		} else {
			suggest = suggestService.getSuggest(sno);
			suggest = suggestService.getCheck(sno);
			url = "redirect:/admin/suggest/detail?sno=" + sno;
		}

		mnv.addObject("suggest", suggest);
		mnv.setViewName(url);

		return mnv;
	}
}
