package com.rundering.manage.admin;

import java.sql.SQLException;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.jsp.command.Criteria;
import com.rundering.dto.LaundryArticlesVO;
import com.rundering.service.OrderGoodsService;

@Controller
@RequestMapping("/admin")
public class OrderGoodsController {
	@Resource(name="orderGoodsService")
	private OrderGoodsService orderGoodsService;
	
	@RequestMapping("/ordergoods/list")
	public ModelAndView OrderGoodsList(Criteria cri, ModelAndView mnv) throws SQLException {
		String url ="admin/ordergoods/ordergoods_list";
		
		Map<String, Object> dataMap = orderGoodsService.getOrderGoods(cri);
		
		mnv.addObject("dataMap", dataMap);
		mnv.setViewName(url);
		
		return mnv;
	}
	
	@RequestMapping("/ordergoods/registForm")
	public String OrderGoodsRegist() {
		String url="admin/ordergoods/ordergoods_regist";
		
		return url;
	}
	
	@RequestMapping("/ordergoods/regist")
	public String regist(LaundryArticlesVO ordergoods,HttpServletRequest request,
						 RedirectAttributes rttr)throws Exception{
		String url="redirect:/admin/ordergoods/list";	
		
		ordergoods.setArticlesName((String)request.getAttribute("XSSname"));
		
		orderGoodsService.regist(ordergoods);
		
		rttr.addFlashAttribute("from","regist");
		
		return url;
	}

	@RequestMapping("/ordergoods/modifyForm")
	public ModelAndView modifyForm(String lndrwaterqlyCode,ModelAndView mnv)throws SQLException{
		String url="board/modify";
		
		mnv.setViewName(url);
		
		return mnv;
	}
	
	@RequestMapping(value="/ordergoods/modify", method=RequestMethod.POST)
	public String modifyPost(LaundryArticlesVO ordergoods,HttpServletRequest request, //BoardModifyCommand modifyReq,
							 RedirectAttributes rttr) throws Exception{
		
		String url = "redirect:/admin/ordergoods/detail";
		
		ordergoods.setArticlesName((String)request.getAttribute("XSSname"));
				
		orderGoodsService.modify(ordergoods);
		
		rttr.addFlashAttribute("from","modify");
		rttr.addAttribute("lndrwaterqlyCode",ordergoods.getArticlesCode());
		
		return url;
	}
	
	
	@RequestMapping(value="/remove",method=RequestMethod.POST)
	public String remove(String lndrwaterqlyCode,RedirectAttributes rttr) throws Exception{
		String url = "redirect:/admin/ordergoods/detail";
		orderGoodsService.remove(lndrwaterqlyCode);		
		
		rttr.addAttribute("lndrwaterqlyCode",lndrwaterqlyCode);
		rttr.addFlashAttribute("from","remove");
		return url;		
	}
	
}
