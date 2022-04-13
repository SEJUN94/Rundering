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

import com.rundering.manage.Criteria;
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
	public String regist(LaundryArticlesVO orderGoods,HttpServletRequest request,
						 RedirectAttributes rttr)throws Exception{
		String url="redirect:/admin/ordergoods/list";	
		
		System.out.println(orderGoods.getClcode());
		orderGoodsService.regist(orderGoods);
		
		rttr.addFlashAttribute("from","regist");
		
		return url;
	}
	
	@RequestMapping("/ordergoods/detail")
	public ModelAndView detail(String articlesCode, String from, ModelAndView mnv)throws SQLException{
		String url="admin/ordergoods/ordergoods_detail";		
		
		LaundryArticlesVO orderGoods =null;
		orderGoods=orderGoodsService.getOrderGoods(articlesCode);
					
		mnv.addObject("orderGoods",orderGoods);		
		mnv.setViewName(url);
		
		return mnv;
	}
	
	@RequestMapping("/ordergoods/modifyForm")
	public ModelAndView ModifyForm(String articlesCode, ModelAndView mnv) throws SQLException{
		String url="admin/ordergoods/ordergoods_modify";
		
		LaundryArticlesVO orderGoods = orderGoodsService.getOrderGoods(articlesCode);
		
		mnv.addObject("orderGoods", orderGoods);
		mnv.setViewName(url);
		
		return mnv;
	}

	@RequestMapping(value="/ordergoods/modify", method=RequestMethod.POST)
	public String modifyPost(LaundryArticlesVO orderGoods,HttpServletRequest request, //BoardModifyCommand modifyReq,
							 RedirectAttributes rttr) throws Exception{
		
		String url = "redirect:/admin/ordergoods/detail";
		
		orderGoodsService.modify(orderGoods);
		
		rttr.addFlashAttribute("from","modify");
		rttr.addAttribute("articlesCode",orderGoods.getArticlesCode());
		
		return url;
	}
	
	@RequestMapping(value="/ordergoods/remove",method=RequestMethod.POST)
	public String remove(String articlesCode,RedirectAttributes rttr) throws Exception{
		String url = "redirect:/admin/ordergoods/detail";
		orderGoodsService.remove(articlesCode);		
		
		rttr.addAttribute("articlesCode",articlesCode);
		rttr.addFlashAttribute("from","remove");
		return url;		
	}
	
	
	
}
