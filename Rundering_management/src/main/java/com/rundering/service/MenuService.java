package com.rundering.service;

import java.util.List;

import com.rundering.dto.MenuVO;

public interface MenuService {
	
	public List<MenuVO> MainBranchMenuList() throws Exception;
	public List<MenuVO> MainAdminMenuList() throws Exception;
	public List<MenuVO> SubMenuList() throws Exception;
	public MenuVO MenuByMenuCode(String menuCode) throws Exception;
	public MenuVO MenuByMenuName(String menuName) throws Exception;
}
