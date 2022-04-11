package com.rundering.manage.branch;

import java.io.File;
import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.rundering.util.MakeFileName;



@Controller
@RequestMapping("/branch/notice")
public class BranchNoticeController {
	
	@RequestMapping(value = "/list")
	private String noticeList() {
		String url="branch/notice/notice_list";
		return url;
	}
	
	@RequestMapping(value = "/detail")
	private String noticeDetail() {
		String url="branch/notice/notice_detail";
		return url;
	}
	

	
	
	
}
