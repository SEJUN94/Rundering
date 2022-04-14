package com.rundering.manage.admin;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.rundering.command.LaundryItemsRegistCommand;
import com.rundering.dto.LaundryItemsVO;
import com.rundering.service.LaundryItemsService;


@Controller
@RequestMapping("/admin/laundryitems")
public class LaundryItemsController {
	
	@Resource(name = "laundryItemsService")
	private LaundryItemsService laundryItemsService;
	
	@RequestMapping("/list")
	public String laundryItemsList() {
		return "admin/laundryitems/laundryitems_list";
	}
	
	@RequestMapping(value = "/regist", method = RequestMethod.GET)
	public String laundryItemRegistForm() {
		return "admin/laundryitems/laundryitems_regist";
	}
	@RequestMapping(value =  "/regist", method = RequestMethod.POST)
	public String laundryItemRegist(LaundryItemsRegistCommand command, ModelAndView mnv) {
		
		LaundryItemsVO laundryItems = command.toLaundryItemsVO();
		laundryItemsService.regist(laundryItems);
		
		return "redirect:/admin/laundryitems/regist";
	}
	
	@RequestMapping("/modify")
	public String laundryItemModify() {
		return "admin/laundryitems/laundryitems_modify";
	}
	
}
