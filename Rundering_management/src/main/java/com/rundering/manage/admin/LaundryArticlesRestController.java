package com.rundering.manage.admin;

import java.io.File;
import java.io.FileInputStream;
import java.io.InputStream;
import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.commons.io.IOUtils;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import com.jsp.util.MakeFileName;
import com.rundering.dto.AttachVO;
import com.rundering.dto.LaundryArticlesVO;
import com.rundering.service.LaundryArticlesService;

@RestController
@RequestMapping("/admin/ordergoods")
public class LaundryArticlesRestController {

	@Resource(name = "picturePath")
	private String picturePath;

	private Map<String, String> savePicture(String oldPicture, MultipartFile multi) throws Exception {
		String fileName = null;
		String fileOrginalName = null;
		Map<String, String> dataMap = new HashMap<String, String>();
		/* 파일유무확인 */
		if (!(multi == null || multi.isEmpty() || multi.getSize() > 1024 * 1024 * 5)) {
			/* 파일저장폴더설정 */
			String uploadPath = picturePath;
			fileName = MakeFileName.toUUIDFileName(multi.getOriginalFilename(), "$$");
			fileOrginalName= multi.getOriginalFilename();
			File storeFile = new File(uploadPath, fileName);
			dataMap.put("fileName", fileName);
			dataMap.put("fileOrginalName", fileOrginalName);
			
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
		return dataMap;
	}

	@RequestMapping(value = "/picture", method = RequestMethod.POST, produces = "application/json;charset=utf-8")
	public ResponseEntity<Map<String, String>> picture(@RequestParam("pictureFile") MultipartFile multi, String oldPicture) throws Exception {
		ResponseEntity<Map<String, String>> entity = null;
		Map<String, String> result = null;
		HttpStatus status = null;

		/* 파일저장확인 */
		if ((result = savePicture(oldPicture, multi)) == null) {
			
			result.put("result", "업로드 실패했습니다.!");
			status = HttpStatus.BAD_REQUEST;
		} else {
			status = HttpStatus.OK;
			result.put("result", "업로드 성공.!");
		}
		entity = new ResponseEntity<Map<String, String>>(result, status);
		
		return entity;
	}
	@RequestMapping(value = "/getPicture", produces = "text/plain;charset=utf-8")
	public ResponseEntity<byte[]> getPicture(String articlesCode, AttachVO attach) throws Exception {

		//String picture = orderGoodsService.getOrderGoods(articlesCode, attach).getPicture();
		InputStream in = null;
		ResponseEntity<byte[]> entity = null;
		String imgPath = this.picturePath;
		try {
		//	in = new FileInputStream(new File(imgPath, picture));
			entity = new ResponseEntity<byte[]>(IOUtils.toByteArray(in), HttpStatus.CREATED);
		} finally {
			in.close();
		}
		return entity;
	}

	@RequestMapping("/idCheck")
	public ResponseEntity<String> idCheck(String articlesCode, AttachVO attach) throws Exception {
		ResponseEntity<String> entity = null;

	//	LaundryArticlesVO ordergoods = orderGoodsService.getOrderGoods(articlesCode, attach);

		/*
		 * if (ordergoods != null) { entity = new ResponseEntity<String>("duplicated",
		 * HttpStatus.OK); } else { entity = new ResponseEntity<String>("",
		 * HttpStatus.OK); }
		 */
		return entity;
	}
}
