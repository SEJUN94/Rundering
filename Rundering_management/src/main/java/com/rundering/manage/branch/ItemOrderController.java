package com.rundering.manage.branch;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.rundering.dto.ItemOrderVO;
import com.rundering.manage.Criteria;
import com.rundering.service.LaundryArticlesService;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

@Controller
@RequestMapping("/branch/itemorder")
public class ItemOrderController {
	@Autowired
	LaundryArticlesService laundryArticlesService; 
	
	@RequestMapping(value="/list",method = RequestMethod.GET)
	private String list() {
		String url= "/branch/itemorder/itemorder_list";
		return url;
	}
	
	
	@RequestMapping("/detail")
	private String detail() {
		String url= "/branch/itemorder/itemorder_detail";
		return url;
	} 
	
	@RequestMapping("/regist")
	private ModelAndView regist( Criteria cri,ModelAndView mnv) {
		String url= "/branch/itemorder/itemorder_regist";
		Map<String, Object> dataMap=null;;
		try {
			dataMap = laundryArticlesService.getLaundryArticles(cri);
		} catch (SQLException e) {
			e.printStackTrace();
		}

		mnv.addObject("dataMap", dataMap);
		mnv.setViewName(url);
		return mnv;
	}
	
	@RequestMapping("detail/modify")
	private String modify() {
		String url = "/branch/itemorder/modify";
		return url;
	
	}

}
