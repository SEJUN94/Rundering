package com.rundering.manage.admin;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.rundering.dto.NoticeVO;
import com.rundering.manage.Criteria;
import com.rundering.service.NoticeService;

@Controller
@RequestMapping("/admin/board")
public class BoardController {
	
	@Autowired
	NoticeService noticeService;
	
	@RequestMapping("/list")
	public ModelAndView noticeList(Criteria cri, ModelAndView mnv) {
		String url = "admin/board/notice_list";
		Map<String, Object> dataMap = null;
		try {
			System.out.println("cri : " + cri.toString());
			dataMap = noticeService.getNoticeList(cri);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		mnv.addObject("dataMap", dataMap);
		mnv.setViewName(url);
		return mnv;
	}
	
	
	@RequestMapping("/noticeregistform")
	public String noticeRegistForm() throws Exception{
		String url = "/admin/board/notice_regist";
		
		return url;
	}
	
	@RequestMapping("/regist")
	public String regist(NoticeVO notice,HttpServletRequest request,
						RedirectAttributes rttr) throws Exception{
		String url = "redirect:/admin/board/list";
		
		//notice.setTitle((String)request.getAttribute("XSStitle"));
		
		noticeService.regist(notice);		
		
		rttr.addFlashAttribute("from","regist");
		
		return url;
	}
	
	@RequestMapping("/noticedetail")
	public ModelAndView noticeDetail(int noticeno,  @RequestParam(defaultValue="") String from, ModelAndView mnv) throws Exception {
		
		String url="admin/board/notice_detail";
		NoticeVO notice = null;
		
		if(!from.equals("list")) {
			notice = noticeService.getNoticeForModify(noticeno);
		}else {
			notice = noticeService.getNotice(noticeno);
			url="redirect:/admin/board/noticedetail.do?noticeno="+noticeno;
		}
		
		mnv.addObject("notice",notice);
		
		mnv.setViewName(url);
		
		return mnv;
		
	}
	
	@RequestMapping("/modifyForm")
	public ModelAndView modifyForm(int noticeno,ModelAndView mnv) throws Exception{
		String url="admin/board/notice_modify";
		
		NoticeVO notice = noticeService.getNoticeForModify(noticeno);
		
		mnv.addObject("notice",notice);
		mnv.setViewName(url);
		
		return mnv;
		
	}
	
	@RequestMapping(value="/noticemodify",method=RequestMethod.POST)
	public String noticeModify(NoticeVO notice,
						     HttpServletRequest request,
							 RedirectAttributes rttr)throws Exception{
		String url = "redirect:/admin/board/noticedetail";
		
		//notice.setTitle(HTMLInputFilter.htmlSpecialChars(notice.getTitle()));
		//notice.setTitle((String)request.getAttribute("XSStitle"));
		
		noticeService.modify(notice);
		
		rttr.addAttribute("noticeno",notice.getNoticeno());
		rttr.addFlashAttribute("from","modify");
		
		return url;
	}
	
	
	@RequestMapping(value="/remove",method=RequestMethod.GET)
	public String remove(int noticeno,RedirectAttributes rttr) throws Exception{
		String url="redirect:/admin/board/noticedetail";
			
		noticeService.remove(noticeno);		
		
		rttr.addFlashAttribute("from","remove");
		rttr.addAttribute("noticeno",noticeno);
		
		return url;
	}
	
	
	
	@RequestMapping("/suggest")
	public String noticeSuggest() {
		return "admin/board/suggest";
	}
}
