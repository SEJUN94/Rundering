package com.rundering.manage.branch;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.rundering.command.ItemOrderRegistCommand;
import com.rundering.dto.EmployeesVO;
import com.rundering.dto.ItemOrderDetailVO;
import com.rundering.dto.ItemOrderVO;
import com.rundering.manage.Criteria;
import com.rundering.service.ItemOrderService;
import com.rundering.service.LaundryArticlesService;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;

@Controller
@RequestMapping("/branch/itemorder")
public class BranchItemOrderController {
	@Autowired
	LaundryArticlesService laundryArticlesService; 
	@Autowired
	ItemOrderService itemOrderService;
	
	
	@RequestMapping(value="/list",method = RequestMethod.GET)
	private ModelAndView list(Criteria cri, ModelAndView mnv,HttpSession session) {
		String url= "/branch/itemorder/itemorder_list";
		
		Map<String, Object> dataMap=null;
		try {
			dataMap = itemOrderService.itemOrdeList(cri,session);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		mnv.addObject("dataMap",dataMap);
		mnv.setViewName(url);
		 
		return mnv;
		
	}
	
	
	@RequestMapping("/detail")
	private ModelAndView detail(String ordercode,ModelAndView mnv,HttpSession session) throws Exception{
		String url= "/branch/itemorder/itemorder_detail";
		String branchCode = itemOrderService.getBranchCode(ordercode);
		EmployeesVO employee =(EmployeesVO) session.getAttribute("loginEmployee");
		Map<String, String> comCodeMap=itemOrderService.comCode();
		
		if(employee==null) {
			url ="/common/loginform";
			mnv.setViewName(url);
			return mnv;
		}
		
		if(!branchCode.equals(employee.getBranchCode())){
			url ="/branch/index";
			mnv.setViewName(url);
			return mnv;
		}
		ItemOrderVO itemOrder = itemOrderService.getItemOrder(ordercode);
		List<ItemOrderDetailVO> itemOrderDetailList= itemOrderService.getItemOrdeDetail(ordercode);
		mnv.addObject("itemOrderDetailList", itemOrderDetailList);
		mnv.addObject("itemOrder", itemOrder);
		mnv.addObject("comCodeMap",comCodeMap);
		mnv.setViewName(url);
		return mnv;
	} 
	
	@RequestMapping("/order")
	private String order( Criteria cri,ModelAndView mnv) {
		String url= "/branch/itemorder/itemorder_regist";
		
		return url;
	}
	@RequestMapping("/regist")
	private String  regist(HttpSession session ,ItemOrderRegistCommand itemOrderRegistCommand) {
		String url = "/branch/itemorder/itemorder_regist";
		EmployeesVO employee= (EmployeesVO) session.getAttribute("loginEmployee");
		ItemOrderVO itemOrder=itemOrderRegistCommand.itemOrderVO();
		itemOrder.setBranchCode(employee.getBranchCode());
		List<ItemOrderDetailVO> itemOrderDetailList =itemOrderRegistCommand.itemOrderDetail();
		
		if(itemOrderDetailList==null) {
			url = "/branch/itemorder/itemorder_regist?from=null";
		}
		try {
			itemOrderService.insertItemOrder(itemOrder, itemOrderDetailList);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return url;
	}
	
	@RequestMapping(value = "/orderGoodsList",method = RequestMethod.GET ,produces = "application/json;charset=UTF-8")
	@ResponseBody
	private Map<String, Object> orderGoodsList(Criteria cri){
		Map<String, Object> dataMap=null;
		try {
			dataMap = laundryArticlesService.getLaundryArticles(cri);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return dataMap;
		
	}
	
	@RequestMapping("/modify")
	private String modify(String ordercode,RedirectAttributes rttr) throws Exception{
		String url = "redirect:/branch/itemorder/modify";
		ItemOrderVO itemOrder = new ItemOrderVO();
		itemOrder.setOrdercode(ordercode);
		itemOrder.setItemOrderStatus("06");
		itemOrderService.updateState(itemOrder);
		
		rttr.addFlashAttribute("from", "modify");
		return url;
	}
	@RequestMapping("/remove")
	private String remove(String ordercode,RedirectAttributes rttr) throws Exception{
		String url = "redirect:/branch/itemorder/list";
		itemOrderService.deleteItemorder(ordercode);
		
		rttr.addFlashAttribute("from", "remove");
		return url;
	}

}
