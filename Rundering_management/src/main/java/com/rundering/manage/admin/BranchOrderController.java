package com.rundering.manage.admin;

import java.sql.SQLException;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.rundering.dto.ItemOrderVO;
import com.rundering.manage.Criteria;
import com.rundering.service.AdminItemOrderService;
import com.rundering.service.ItemOrderService;

@Controller
@RequestMapping("/admin")
public class BranchOrderController {
	
	@Resource(name="adminItemOrderService")
	private AdminItemOrderService adminItemOrderService;
	
	@RequestMapping("/branchorder/list")
	public ModelAndView branchItemOrderList(Criteria cri, ModelAndView mnv) throws SQLException {
		String url = "/admin/branchorder/equipment_order_list";

		Map<String, Object> dataMap = adminItemOrderService.getItemOrderList(cri);

		mnv.addObject("dataMap", dataMap);
		mnv.setViewName(url);
		return mnv;
	}
	
	@RequestMapping("/branchorder/detail")
	public ModelAndView branchOrderDetail(String ordercode, ModelAndView mnv) throws SQLException{
		String url = "admin/branchorder/equipment_order_detail";
		
		Map<String, Object> dataMap = adminItemOrderService.getItemOrderDetailList(ordercode);
		
		mnv.addObject("dataMap", dataMap);
		mnv.setViewName(url);
		
		return mnv;
	}
	
	@RequestMapping(value="/branchorder/modifyStatus", method=RequestMethod.POST)
	public String branchOrderModify(ItemOrderVO itemOrder, RedirectAttributes rttr) throws SQLException{
		String url="redirect:/admin/branchorder/detail";
		
		adminItemOrderService.modifyStatus(itemOrder);
		
		rttr.addFlashAttribute("from","modify");
		rttr.addAttribute("ordercode", itemOrder.getOrdercode());
		
		return url;
		
	}
}
