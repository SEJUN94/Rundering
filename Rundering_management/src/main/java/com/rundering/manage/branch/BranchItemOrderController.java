package com.rundering.manage.branch;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

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

@Controller
@RequestMapping("/branch/itemorder")
public class BranchItemOrderController {
	@Autowired
	LaundryArticlesService laundryArticlesService; 
	@Autowired
	ItemOrderService itemOrderService;
	
	
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
	
	@RequestMapping("detail/modify")
	private String modify() {
		String url = "/branch/itemorder/modify";
		return url;
	
	}

}
