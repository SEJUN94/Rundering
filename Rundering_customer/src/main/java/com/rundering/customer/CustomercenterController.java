package com.rundering.customer;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/customercenter")
public class CustomercenterController {

	@RequestMapping("/faq")
	private String faq() {
		String url = "customercenter/frequently_questions";
		return url;
	}
	@RequestMapping("/question/board")
	private String board() {
		String url = "customercenter/question_board";
		return url;
	}
	@RequestMapping("/question/detail")
	private String detail() {
		String url = "customercenter/question_detail";
		return url;
	}
	@RequestMapping("/question/regist")
	private String regist() {
		String url = "customercenter/question_regist";
		return url;
	}	
	@RequestMapping("/question/modify")
	private String modify() {
		String url = "customercenter/question_modify";
		return url;
	}
}
