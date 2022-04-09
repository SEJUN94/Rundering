package com.rundering.customer.mypage;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/mypage")
public class MypageController {

	@RequestMapping("/privacyCheck")
	private String privacyCheck() {
		String url = "mypage/my_privacy_check";
		return url;
	}
	@RequestMapping("/privacy")
	private String privacy() {
		String url = "mypage/my_privacy";
		return url;
	}
	@RequestMapping("/secede")
	private String secede() {
		String url = "mypage/my_secede";
		return url;
	}
	@RequestMapping("/voicelist")
	private String voiceList() {
		String url = "mypage/my_voiceList";
		return url;
	}@RequestMapping("/orderhistory")
	private String orderhistory() {
		String url = "mypage/order_history";
		return url;
	}
}
