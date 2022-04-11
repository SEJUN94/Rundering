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
@RequestMapping("/branch/suggest")
public class BranchSuggestController {
	@RequestMapping(value = "/list")
	private String list() {
		String url="branch/suggest/suggest_list";
		return url;
	}
	@RequestMapping(value = "/regist")
	private String regist() {
		String url="branch/suggest/suggest_regist";
		return url;
	}
	
	@Resource(name = "boardPath")
	private String boardPath;
	
	@ResponseBody
	@RequestMapping(value = "/suggest/upload", produces = "application/json;charset=UTF-8")
	private ResponseEntity<HashMap<String, String>> savePicture(@RequestParam("file") MultipartFile multi,String oldPicture) throws Exception {
		
		String fileName = null;
		HashMap<String, String> dataMap = new HashMap<String, String>();
		/* 파일유무확인 */
		ResponseEntity<HashMap<String, String>> entity = null;
		if (!(multi == null || multi.isEmpty() || multi.getSize() > 1024 * 1024 * 2)) {

			/* 파일저장폴더설정 */
			String uploadPath = boardPath;
			fileName = MakeFileName.toUUIDFileName(multi.getOriginalFilename(), "$$");
			File storeFile = new File(uploadPath, fileName);
			dataMap.put("fileName", fileName);
			dataMap.put("originalFileName",multi.getOriginalFilename());
			storeFile.mkdirs();

			// local HDD 에 저장.
			multi.transferTo(storeFile);
			entity = new ResponseEntity<HashMap<String, String>>(dataMap, HttpStatus.OK);
			if (oldPicture != null && !oldPicture.isEmpty()) {
				File oldFile = new File(uploadPath, oldPicture);
				if (oldFile.exists()) {
					oldFile.delete();
				}
			}
		}
		else {
			entity = new ResponseEntity<HashMap<String, String>>(dataMap, HttpStatus.INTERNAL_SERVER_ERROR);
		}
		
		return entity;
	}
	

	
	
	
}
