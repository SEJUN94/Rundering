package com.rundering.customer;

import java.sql.SQLException;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.rundering.dto.MemberAddressVO;
import com.rundering.dto.MemberVO;
import com.rundering.service.MemberAddressService;
import com.rundering.service.MemberService;
import com.rundering.util.UserSha256;


@RequestMapping("/mypage")
@Controller
public class MyPageController {
	
	@Resource(name="memberService")
	private MemberService memberService;
	
	@Resource(name="memberAddressService")
	private MemberAddressService memberAddressService;
	
	@RequestMapping("")
	public String mypage() {
		String url = "/mypage/my_privacy_check";
		return url;
	}	
	
	@RequestMapping("/pwCheck")
	public ResponseEntity<String> pwCheck(String password,HttpSession session) throws Exception {
		ResponseEntity<String> entity = null;
		
		MemberVO loginUser = (MemberVO)session.getAttribute("loginUser");
		
		password = UserSha256.encrypt(password);
		
		try {
			String pw = memberService.checkPw(loginUser.getId());
			if (password.equals(pw)) {
				entity = new ResponseEntity<String>("duplicated", HttpStatus.OK);
			} else {
				entity = new ResponseEntity<String>("", HttpStatus.OK);
			}
		} catch (SQLException e) {
			entity = new ResponseEntity<String>(HttpStatus.INTERNAL_SERVER_ERROR);
		}


		return entity;
	}
	
	
	@RequestMapping("/memberModify")
	public ModelAndView memberModify(HttpServletRequest request, ModelAndView mnv) throws Exception {
		String url = "/mypage/my_privacy";
		
		HttpSession session = request.getSession();
		MemberVO loginUser = (MemberVO) session.getAttribute("loginUser");
		
		loginUser.setPassword(UserSha256.encrypt(loginUser.getPassword()));
		List<MemberAddressVO> memberAddressList = memberAddressService.getMemberAddressList(loginUser.getMemberNo());
		mnv.addObject("memberAddressList",memberAddressList);
		mnv.setViewName(url);
		
		return mnv;
	}
	
	@RequestMapping("/pwModify")
	public ResponseEntity<String> pwModify(HttpServletRequest request,String password) throws Exception {
		ResponseEntity<String> entity = null;
		
		HttpSession session = request.getSession();
		MemberVO loginUser = (MemberVO) session.getAttribute("loginUser");
	
		String pw = UserSha256.encrypt(password);
		loginUser.setPassword(pw);

		try {
			
			memberService.updatePassword(loginUser);
			
			entity = new ResponseEntity<String>("OK", HttpStatus.OK);
		} catch (SQLException e) {
			entity = new ResponseEntity<String>(HttpStatus.INTERNAL_SERVER_ERROR);
		}

	return entity;
	}
	
	
	//주문내역
	@RequestMapping("/orderhistory")
	private String orderhistory() {
		String url = "mypage/order_history";
		return url;
	}

	
	//문의내역
	@RequestMapping("/voicelist")
	private String voiceList() {
		String url = "mypage/my_voiceList";
		return url;
	}
	
	
	//회원탈퇴폼
	@RequestMapping("/secedeform")
	private String secedeform() {
		String url = "mypage/my_secede";
		return url;
	}
	
	
	//회원탈퇴
	@RequestMapping("/secede")
	@ResponseBody
	private ResponseEntity<String> secede(HttpServletRequest request,String password) throws Exception {
		ResponseEntity<String> entity = null;
		
			HttpSession session = request.getSession();
			MemberVO loginUser = (MemberVO) session.getAttribute("loginUser");
		
			String pw = UserSha256.encrypt(password);
		try {
			
			String upw = memberService.checkPw(loginUser.getId());
			
			if (upw.equals(pw) ) {
				memberService.deleteMember(loginUser.getId());
				entity = new ResponseEntity<String>("OK", HttpStatus.OK);
			} else {
				entity = new ResponseEntity<String>("", HttpStatus.OK);
			}
		} catch (SQLException e) {
			entity = new ResponseEntity<String>(HttpStatus.INTERNAL_SERVER_ERROR);
		}

		return entity;
	}
	
	
	
}
