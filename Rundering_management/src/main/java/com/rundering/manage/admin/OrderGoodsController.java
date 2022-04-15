package com.rundering.manage.admin;

import java.io.File;
import java.sql.SQLException;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.bind.annotation.RestControllerAdvice;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.rundering.manage.Criteria;
import com.rundering.dto.LaundryArticlesVO;
import com.rundering.service.OrderGoodsService;
import com.rundering.util.MakeFileName;

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
	
	@RequestMapping(value = "/ordergoods/regist", method = RequestMethod.POST)
	public String regist(LaundryArticlesVO orderGoods,HttpServletRequest request,
						 RedirectAttributes rttr)throws Exception{
		String url="redirect:/admin/ordergoods/list";	
		
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
		
		String picture = MakeFileName.parseFileNameFromUUID(orderGoods.getPicture(), "\\$\\$");
		orderGoods.setPicture(picture);
		
		mnv.addObject("orderGoods", orderGoods);
		mnv.setViewName(url);
		
		return mnv;
	}

	@RequestMapping(value="/ordergoods/modify", method=RequestMethod.POST)
	public String modifyPost(LaundryArticlesVO orderGoods,HttpServletRequest request, //BoardModifyCommand modifyReq,
							 RedirectAttributes rttr) throws Exception{
		
		String url = "redirect:/admin/ordergoods/detail";
		
		// 신규 파일 변경 및 기존 파일 삭제
		String oldPicture = orderGoodsService.getOrderGoods(orderGoods.getArticlesCode()).getPicture();
		if(orderGoods.getUploadPicture()!=null && !orderGoods.getUploadPicture().isEmpty()) {			
			String fileName = savePicture(oldPicture, orderGoods.getPictureFile());
			orderGoods.setPicture(fileName);
		}else {
			orderGoods.setPicture(oldPicture);			
		}
		
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
	
	@Resource(name = "picturePath")
	private String picturePath;
	
	private String savePicture(String oldPicture, MultipartFile multi) throws Exception {
		String fileName = null;

		/* 파일유무확인 */
		if (!(multi == null || multi.isEmpty() || multi.getSize() > 1024 * 1024 * 5)) {

			/* 파일저장폴더설정 */
			String uploadPath = picturePath;
			fileName = MakeFileName.toUUIDFileName(multi.getOriginalFilename(), "$$");
			File storeFile = new File(uploadPath, fileName);

			storeFile.mkdirs();

			// local HDD 에 저장.
			multi.transferTo(storeFile);

			if (oldPicture != null && !oldPicture.isEmpty()) {
				File oldFile = new File(uploadPath, oldPicture);
				if (oldFile.exists()) {
					oldFile.delete();
				}
			}
		}
		return fileName;
	}
}
