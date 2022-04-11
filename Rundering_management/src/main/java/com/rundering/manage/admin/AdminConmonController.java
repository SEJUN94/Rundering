package com.rundering.manage.admin;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.rundering.dto.MenuVO;
import com.rundering.service.MenuService;

@Controller
public class AdminConmonController {
	
	@Autowired
	private MenuService menuService;
	
	@RequestMapping("/admin/index")
	public String index(@RequestParam(defaultValue = "B000000") String menuCode, Model model) throws Exception {
		String url = "admin/admin_index";

		List<MenuVO> mainMenuList = menuService.MainAdminMenuList();
		List<MenuVO> subMenuList = menuService.SubMenuList();
		MenuVO menu= menuService.MenuByMenuCode(menuCode);
		model.addAttribute("mainMenuList", mainMenuList);
		model.addAttribute("subMenuList", subMenuList);
		model.addAttribute("menu", menu);

		return url;
	}
}
