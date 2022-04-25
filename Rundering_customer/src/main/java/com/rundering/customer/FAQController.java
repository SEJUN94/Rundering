package com.rundering.customer;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.rundering.dto.FAQVO;
import com.rundering.service.FAQService; 

@Controller
@RequestMapping("/question")
public class FAQController {
	
	@Autowired
	FAQService faqService;

	// 리스트
	@RequestMapping(value = "/list")
	private ModelAndView faqList(Criteria cri, ModelAndView mnv) throws Exception {
		String url = "question/question_list";

		Map<String, Object> dataMap = faqService.getFAQList(cri);
		mnv.addObject("dataMap", dataMap);
		mnv.setViewName(url);

		return mnv;
	}
	
	@RequestMapping("/registForm")
	private String faqRegistForm() {

		String url = "question/question_regist";

		return url;
	}
	
	@RequestMapping(value = "/regist")
	public String faqRegist(FAQVO faq, HttpServletRequest request, RedirectAttributes rttr)
			throws Exception {

		String url = "redirect:/question/list";

		faqService.regist(faq);
		
		rttr.addFlashAttribute("from", "regist");

		return url;
	}
	
	@RequestMapping("/faq")
	private String faq() {
		String url = "question/frequently_questions";
		return url;
	}
	
	@RequestMapping("/detail")
	private String detail() {
		String url = "question/question_detail";
		return url;
	}
	
	@RequestMapping("/modify")
	private String modify() {
		String url = "question/question_modify";
		return url;
	}
}
