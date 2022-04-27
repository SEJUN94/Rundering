package com.rundering.customer;

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

import com.rundering.command.Criteria;
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
	
	@RequestMapping(value = "/detail")
	private ModelAndView faqDetail(int faqno, @RequestParam(defaultValue = "") String from,
			HttpServletRequest request, ModelAndView mnv, HttpSession session) throws SQLException {

		String url = "question/question_detail";

		FAQVO faq = faqService.getFAQModify(faqno);
		
		mnv.addObject("faq", faq);
		mnv.setViewName(url);

		return mnv;
	}
	
	@RequestMapping("/modifyForm")
	public ModelAndView modifyForm(int faqno, ModelAndView mnv) throws Exception {

		String url = "question/question_modify";

		FAQVO faq = faqService.getFAQModify(faqno);
	
		mnv.addObject("faq", faq);
		
		mnv.setViewName(url);

		return mnv;
	}

	@RequestMapping(value = "/modify", method = RequestMethod.POST)
	public String modifyPost(FAQVO faq, HttpServletRequest request, RedirectAttributes rttr) throws Exception {

		String url = "redirect:/question/detail";
		
		faqService.modify(faq);

		rttr.addAttribute("faqno", faq.getFaqno());
		rttr.addFlashAttribute("from", "modify");

		return url;
	}

	@RequestMapping(value = "/remove", method = RequestMethod.GET)
	public String remove(int faqno, RedirectAttributes rttr) throws Exception {
		String url = "redirect:/question/detail";

		faqService.remove(faqno);

		rttr.addFlashAttribute("from", "remove");
		rttr.addAttribute("faqno", faqno);

		return url;
	}
}
