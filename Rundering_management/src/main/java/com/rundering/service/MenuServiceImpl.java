package com.rundering.service;

import java.util.List;

import com.rundering.dao.MenuDAOBean;
import com.rundering.dto.MenuVO;

public class MenuServiceImpl implements MenuService {
	
	private MenuDAOBean menuDAOBean;
	
	public void setMenuDAOBean(MenuDAOBean menuDAOBean) {
		this.menuDAOBean = menuDAOBean;
	}
	@Override
	public List<MenuVO> MainBranchMenuList() throws Exception {
		List<MenuVO> menuList = menuDAOBean.selectBranchMainMenu(); 
		return menuList;
	}
	@Override
	public List<MenuVO> MainAdminMenuList() throws Exception {
		List<MenuVO> menuList = menuDAOBean.selectAdminMainMenu(); 
		return menuList;
	}


	@Override
	public List<MenuVO> SubMenuList() throws Exception {
		List<MenuVO> menuList = menuDAOBean.selectSubMenu();
		return menuList;
	}

	@Override
	public MenuVO MenuByMenuCode(String menuCode) throws Exception {
		MenuVO menu = menuDAOBean.selectMenuByMenuCode(menuCode);
		return menu;
	}

	@Override
	public MenuVO MenuByMenuName(String menuName) throws Exception {
		MenuVO menu = menuDAOBean.selectMenuByMenuName(menuName);
		return menu;
	}

}
