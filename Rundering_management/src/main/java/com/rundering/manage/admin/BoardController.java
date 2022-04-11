package com.rundering.manage.admin;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/admin/board")
public class BoardController {

	@RequestMapping("/noticelist")
	public String noticeList() {
		return "admin/board/notice_list";
	}
	
	@RequestMapping("/noticeregist")
	public String noticeRegist() {
		return "admin/board/notice_regist";
	}
	
	@RequestMapping("/noticedetail")
	public String noticeDetail() {
		return "admin/board/notice_detail";
	}
	
	@RequestMapping("/noticemodify")
	public String noticeModify() {
		return "admin/board/notice_modify";
	}
	
	@RequestMapping("/suggest")
	public String noticeSuggest() {
		return "admin/board/suggest";
	}
}
