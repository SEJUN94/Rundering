package com.rundering.manage.admin;

import java.sql.SQLException;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.rundering.manage.Criteria;
import com.rundering.service.ItemOrderService;

@Controller
@RequestMapping("/admin")
public class BranchOrderController {
	
	@Resource(name="itemOrderService")
	private ItemOrderService itemOrderService;
	
	@RequestMapping("/branchorder/list")
	public ModelAndView branchItemOrderList(Criteria cri, ModelAndView mnv) throws SQLException {
		String url = "/admin/branchorder/equipment_order_list";

		Map<String, Object> dataMap = itemOrderService.getItemOrderList(cri);

		mnv.addObject("dataMap", dataMap);
		mnv.setViewName(url);
		return mnv;
	}
	
	@RequestMapping("/branchorder/detail")
	public String branchOrderDetail() {
		return "admin/branchorder/equipment_order_detail";
	}
	
}
