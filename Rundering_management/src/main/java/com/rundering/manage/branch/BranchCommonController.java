package com.rundering.manage.branch;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.rundering.dto.MenuVO;
import com.rundering.service.MenuService;


@Controller
public class BranchCommonController {
	@Autowired
	private MenuService menuService;
	
	@RequestMapping("/branch/index")
	public String index(@RequestParam(defaultValue = "B000000") String menuCode, Model model,HttpServletRequest request) throws Exception {
		String url = "branch/branch_index";
		
		HttpSession session = request.getSession();
		session.getAttribute("loginMember");
		session.getAttribute("loginEmployee");
		
		
		Map<String, List<MenuVO>> dataMap = menuService.getBranchMenuList();
		List<String> key = new ArrayList<String>(); 
		for (String keyValue : dataMap.keySet()) {
			key.add(keyValue);
		}
		MenuVO menu = menuService.MenuByMenuCode(menuCode);
		
		model.addAttribute("key", key);
		model.addAttribute("dataMap", dataMap);
		model.addAttribute("menu", menu);
		return url;
	}
}
