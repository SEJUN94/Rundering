package com.rundering.manage.admin;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.rundering.dto.NoticeVO;
import com.rundering.service.NoticeService;

@Controller
@RequestMapping("/admin/board")
public class BoardController {
	
	@Autowired
	NoticeService noticeService;
	
	@RequestMapping("/noticelist")
	public ModelAndView noticeList(ModelAndView mnv) {
		String url = "admin/board/notice_list";
		Map<String, Object> dataMap = null;
		try {
			dataMap = noticeService.getNoticeList();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		mnv.addObject("dataMap", dataMap);
		mnv.setViewName(url);
		return mnv;
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
