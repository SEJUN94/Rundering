package com.rundering.manage.branch;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.rundering.dto.ItemOrderVO;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Controller;

@Controller
@RequestMapping("/branch/itemorder")
public class ItemOrderController {
	
	@RequestMapping( value =  "/list", method = RequestMethod.POST)
	@ResponseBody
	private List<ItemOrderVO> list() {
		String url= "/branch/itemorder/itemorder_list";
		return null;
	}
	
	
	@RequestMapping("/detail")
	private String detail() {
		String url= "/branch/itemorder/itemorder_detail";
		return url;
	}
	
	@RequestMapping("/regist")
	private String regist() {
		String url= "/branch/itemorder/itemorder_regist";
		return url;
	}
	
	@RequestMapping("detail/modify")
	private String modify() {
		String url = "/branch/itemorder/modify";
		return url;
	
	}

}
