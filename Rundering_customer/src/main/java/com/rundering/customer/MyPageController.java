package com.rundering.customer;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.rundering.command.Criteria;
import com.rundering.command.MemberAddCommand;
import com.rundering.command.MyOrderCriteria;
import com.rundering.dto.LaundryOrderVO;
import com.rundering.dto.MemberAddressVO;
import com.rundering.dto.MemberVO;
import com.rundering.service.FAQService;
import com.rundering.service.LaundryOrderService;
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
	
	@Autowired
	private LaundryOrderService laundryOrderService; 
	
	@Autowired
	FAQService faqService;
	
	// 비밀번호 체크 폼
	@RequestMapping("")
	public String mypage() {
		String url = "/mypage/my_privacy_check";
		return url;
	}	
	
	// 비밀번호 체크
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
	
	// 회원정보 수정 폼
	@RequestMapping("/memberModifyform")
	public ModelAndView memberModifyForm(HttpServletRequest request, ModelAndView mnv) throws Exception {
		String url = "/mypage/my_privacy";
		
		HttpSession session = request.getSession();
		MemberVO loginUser = (MemberVO) session.getAttribute("loginUser");
		
		//loginUser.setPassword(UserSha256.encrypt(loginUser.getPassword()));
		MemberAddressVO memberAddress = memberAddressService.getDefaultMemberAddress(loginUser.getMemberNo());
		mnv.addObject("memberAddress",memberAddress);
		mnv.setViewName(url);
		
		return mnv;
	}
	
	// 회원정보 수정 폼
	@RequestMapping("/memberModify")
	public ResponseEntity<String> memberModify(MemberAddCommand mac) {
		
		ResponseEntity<String> entity = null;
		
		try {
			memberService.modifyMember(mac);
			
			entity = new ResponseEntity<String>("OK", HttpStatus.OK);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return entity;
	}
	
	// 비밀번호 비동기 변경
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
	
	
	//문의내역
	@RequestMapping("/myinquiry/list")
	private ModelAndView myInquiryList(Criteria cri, ModelAndView mnv) throws Exception {
		String url = "mypage/my_inquiry_list";
		
		Map<String, Object> dataMap = faqService.getFAQList(cri);
		mnv.addObject("dataMap", dataMap);
		mnv.setViewName(url);

		return mnv;
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
	
	// 이메일 중복 체크 
	@RequestMapping("/emailCheck")
	@ResponseBody
	public ResponseEntity<String> emailCheck(String email) throws Exception {
		ResponseEntity<String> entity = null;
		
		try {
			MemberAddCommand mac = memberService.checkEmail(email);
			if (mac != null) {
				entity = new ResponseEntity<String>("OK", HttpStatus.OK);
			} else {
				entity = new ResponseEntity<String>("", HttpStatus.OK);
			}
		} catch (SQLException e) {
			entity = new ResponseEntity<String>(HttpStatus.INTERNAL_SERVER_ERROR);
		}

		return entity;
	}
	
	// 내 주소 관리
	@RequestMapping("/myaddress")
	public ModelAndView myaddress(HttpServletRequest request, ModelAndView mnv) throws Exception {
		String url = "/mypage/my_address";
		
		HttpSession session = request.getSession();
		MemberVO loginUser = (MemberVO) session.getAttribute("loginUser");
		
		MemberAddressVO defaultMemberAddress = memberAddressService.getDefaultMemberAddress(loginUser.getMemberNo());
		mnv.addObject("defaultMemberAddress",defaultMemberAddress);
		
		List<MemberAddressVO> memberAddressList = memberAddressService.getMemberAddressList(loginUser.getMemberNo());
		mnv.addObject("memberAddressList",memberAddressList);
		
		mnv.setViewName(url);
		
		return mnv;
	}	
	
	
	// 내 주소 디테일
	@RequestMapping("/myaddress/detail")
	@ResponseBody
	public ResponseEntity<MemberAddressVO> addrDetail(String addressNo){
		
		ResponseEntity<MemberAddressVO> entity = null;
		
		
		try {
		
			MemberAddressVO mv = memberAddressService.getMemberAddress(addressNo);
			
			String addrNo = mv.getAddressNo()+"";
			
			mv.setAddrNo(addrNo);
			
			if (mv != null) {
				entity = new ResponseEntity<MemberAddressVO>(mv, HttpStatus.OK);
			} 
		} catch (SQLException e) {
			entity = new ResponseEntity<MemberAddressVO>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
		return entity;
	}
	
	// 내 주소 기본 주소지로 변경 및 수정
	@RequestMapping("/myaddress/defaultmodify")
	@ResponseBody
	public ResponseEntity<String> modifyDefaultAdd(HttpServletRequest request, MemberAddressVO memberAdd){
		ResponseEntity<String> rs = null;
		
		HttpSession session = request.getSession();
		MemberVO mv = (MemberVO) session.getAttribute("loginUser");
		
		int addressNo =  Integer.parseInt(memberAdd.getAddrNo());
		
		memberAdd.setAddressNo(addressNo);
		memberAdd.setMemberNo(mv.getMemberNo());
		try {
			memberAddressService.modifyDefaultAddress(memberAdd);
			rs = new ResponseEntity<String>("OK", HttpStatus.OK);
		} catch (Exception e) {
			rs = new ResponseEntity<String>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
		return rs;
	}
		
	// 내 주소지 수정
	@RequestMapping("/myaddress/modify")
	@ResponseBody
	public ResponseEntity<String> modifyAdd(MemberAddressVO memberAdd){
		ResponseEntity<String> rs = null;
		
		int addressNo =  Integer.parseInt(memberAdd.getAddrNo());
		
		memberAdd.setAddressNo(addressNo);
		memberAdd.setAddressNo(addressNo);
		
		try {
			memberAddressService.modifyAddress(memberAdd);
			rs = new ResponseEntity<String>("OK", HttpStatus.OK);
		} catch (Exception e) {
			rs = new ResponseEntity<String>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
		return rs;
	}
	
	// 내 주소지 기본 주소지로 변경 및 등록
	@RequestMapping("/myaddress/defaultregist")
	@ResponseBody
	public ResponseEntity<String> defaultAddressRegist(HttpServletRequest request,MemberAddressVO memberAdd){
		ResponseEntity<String> rs = null;
		
		HttpSession session = request.getSession();
		MemberVO mv = (MemberVO) session.getAttribute("loginUser");
		
		memberAdd.setMemberNo(mv.getMemberNo());
		
		try {
			memberAddressService.defaultAddressRegist(memberAdd);
			rs = new ResponseEntity<String>("OK", HttpStatus.OK);
		} catch (Exception e) {
			rs = new ResponseEntity<String>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
		return rs;
	}
	
	// 내 주소지 추가 등록
	@RequestMapping("/myaddress/regist")
	@ResponseBody
	public ResponseEntity<String> addAddressRegist(HttpServletRequest request,MemberAddressVO memberAdd){
		ResponseEntity<String> rs = null;
		
		HttpSession session = request.getSession();
		MemberVO mv = (MemberVO) session.getAttribute("loginUser");
		
		memberAdd.setMemberNo(mv.getMemberNo());
		
		try {
			memberAddressService.addAddressRegist(memberAdd);
			rs = new ResponseEntity<String>("OK", HttpStatus.OK);
		} catch (Exception e) {
			rs = new ResponseEntity<String>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
		return rs;
	}
	
	
	/* ***********************************  여기서 부터 주문 내역  *********************************** */
	@RequestMapping("/myorder/histroy/main")
	public ModelAndView myorder(HttpServletRequest request, ModelAndView mnv,MyOrderCriteria cri) throws Exception {
		String url = "/mypage/order_history";
		
		HttpSession session = request.getSession();
		MemberVO loginUser = (MemberVO) session.getAttribute("loginUser");
		LaundryOrderVO laundryOrder = new LaundryOrderVO();
		
		// 세션을 통해 고객번호 받아오기!
		laundryOrder.setMemberNo(loginUser.getMemberNo());
		cri.setMemberNo(loginUser.getMemberNo());
		
		Map<String, Object> dataMap = laundryOrderService.getMyOrderList(cri);
		
		
		mnv.addObject("dataMap",dataMap);
		mnv.setViewName(url);
		
		return mnv;
	}
	
	
	
	
	
	
	
	
	
	
	
}
