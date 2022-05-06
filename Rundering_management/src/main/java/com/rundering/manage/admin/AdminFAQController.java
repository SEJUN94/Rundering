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

import com.rundering.command.AcoCriteria;
import com.rundering.command.FAQCriteria;
import com.rundering.dto.FAQVO;
import com.rundering.service.FAQService;

@Controller
@RequestMapping("/admin/question")
public class AdminFAQController {

	@Autowired
	FAQService faqService;
	
	//아코디언
	@RequestMapping("/faq")
	private ModelAndView frequentlyList(AcoCriteria cri, HttpServletRequest request, ModelAndView mnv) throws Exception {
		String url = "admin/question/frequently_questions";
		
		Map<String, Object> dataMap = faqService.getFAQFrequentlyList(cri);
		mnv.addObject("dataMap", dataMap);
		mnv.setViewName(url);
		
		return mnv;
	}
		
	// 리스트
	@RequestMapping(value = "/list")
	private ModelAndView faqList(FAQCriteria cri, ModelAndView mnv) throws Exception {
		String url = "admin/question/question_list";

		Map<String, Object> dataMap = faqService.getFAQList(cri);
		mnv.addObject("dataMap", dataMap);
		mnv.setViewName(url);

		return mnv;
	}

	@RequestMapping(value = "/detail")
	private ModelAndView faqDetail(int faqno, @RequestParam(defaultValue = "") String from, HttpServletRequest request,
			ModelAndView mnv, HttpSession session) throws SQLException {

		String url = "admin/question/question_detail";

		FAQVO faq = null;

		faq = faqService.getFAQReply(faqno);

		mnv.addObject("faq", faq);
		mnv.setViewName(url);

		return mnv;
	}

	@RequestMapping("/replyForm")
	public ModelAndView replyForm(int faqno, ModelAndView mnv) throws Exception {

		String url = "admin/question/question_reply";

		FAQVO faq = faqService.getFAQReply(faqno);

		mnv.addObject("faq", faq);

		mnv.setViewName(url);

		return mnv;
	}

	@RequestMapping(value = "/reply", method = RequestMethod.POST)
	public String replyPost(FAQVO faq, HttpServletRequest request, RedirectAttributes rttr) throws Exception {

		String url = "redirect:/admin/question/detail";
		
		faqService.reply(faq);

		rttr.addAttribute("faqno", faq.getFaqno());
		rttr.addFlashAttribute("from", "reply");

		return url;
	}
	
	@RequestMapping(value = "/modify", method = RequestMethod.POST)
	public String modify(FAQVO faq, HttpServletRequest request, RedirectAttributes rttr) throws Exception {

		String url = "redirect:admin/question/faq";

		faqService.modify(faq);

		rttr.addAttribute("faqno", faq.getFaqno());
		rttr.addFlashAttribute("from", "modify");

		return url;
	}
	
	@RequestMapping(value = "/remove", method = RequestMethod.GET)
	public String remove(int faqno, RedirectAttributes rttr) throws Exception {
		String url = "redirect:/admin/question/faq";

		faqService.remove(faqno);

		rttr.addFlashAttribute("from", "remove");
		rttr.addAttribute("faqno", faqno);

		return url;
	}
}
