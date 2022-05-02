package com.rundering.customer;

import java.io.File;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.jsp.util.MakeFileName;
import com.rundering.command.LaundryOrderReceiveCommand;
import com.rundering.dto.BranchApplicationVO;
import com.rundering.service.AttachService;
import com.rundering.service.BranchApplicationService;

@RequestMapping("/branchapplication")
@Controller
public class BranchApplicationController {
	
	@Resource(name = "attachService")
	private AttachService attachService;
	
	@Resource(name = "filePath")
	private String filePath;
	
	
	@Resource(name="branchApplicationService")
	private BranchApplicationService branchApplicationService;
	
	@RequestMapping("/regist")
	public void branchApplication() {}
	

	private Map<String, String> savePicture(MultipartFile multi) throws Exception {
		String fileName = null;
		String fileOrginalName = null;
		Map<String, String> dataMap = new HashMap<String, String>();
		/* 파일유무확인 */
		if (!(multi == null || multi.isEmpty() || multi.getSize() > 1024 * 1024 * 5)) {
			/* 파일저장폴더설정 */
			String uploadPath = filePath;
			fileName = MakeFileName.toUUIDFileName(multi.getOriginalFilename(), "$$");
			fileOrginalName= multi.getOriginalFilename();
			File storeFile = new File(uploadPath, fileName);
			dataMap.put("fileName", fileName);
			dataMap.put("fileOrginalName", fileOrginalName);
			
			storeFile.mkdirs();

			// local HDD 에 저장.
			multi.transferTo(storeFile);

		}
		return dataMap;
	}
	@RequestMapping(value = "/picture", method = RequestMethod.POST, produces = "application/json;charset=utf-8")
	public ResponseEntity<Map<String, String>> picture(@RequestParam("pictureFile") MultipartFile multi) throws Exception {
		ResponseEntity<Map<String, String>> entity = null;
		Map<String, String> result = null;
		HttpStatus status = null;

		/* 파일저장확인 */
		if ((result = savePicture(multi)) == null) {
			
			result.put("result", "업로드 실패했습니다.!");
			status = HttpStatus.BAD_REQUEST;
		} else {
			status = HttpStatus.OK;
			result.put("result", "업로드 성공!!");
		}
		entity = new ResponseEntity<Map<String, String>>(result, status);
		
		
		return entity;
	}
	
	@RequestMapping("/registform")
	public ResponseEntity<String> insertBranchApp(@RequestParam(defaultValue = "") String from,LaundryOrderReceiveCommand command,BranchApplicationVO bv) throws Exception {
		ResponseEntity<String> entity = null;
		
		try {
				
			branchApplicationService.branchApplicate(bv);
				
			entity = new ResponseEntity<String>("OK", HttpStatus.OK);
				
		} catch (SQLException e) {
			e.printStackTrace();
			entity = new ResponseEntity<String>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
			
		
		return entity;
	}
	
	@RequestMapping("/my_branch_request")
	public void myBranchRequest() {
		
	}
	
	@RequestMapping("/self_authentification")
	public void selfAuthentification() {}

	
	
	//인증 후 지점 신청 확인
	@RequestMapping("/self_authentification/comfirm")
	@ResponseBody
	public ResponseEntity<String> selfAuthentificationCom(BranchApplicationVO bv) throws Exception{
		
		ResponseEntity<String> entity = null;
		
	    try{
	    	bv = branchApplicationService.getSelfAuthentification(bv);
	    	
	    	
	    	if (bv.getPhone() == null || bv.getPhone().isEmpty()) {

	    		entity = new ResponseEntity<String>("NO", HttpStatus.OK);

			} else {
				entity = new ResponseEntity<String>("OK", HttpStatus.OK);
				
			}
	    	
	    }catch(Exception e){
	    	entity = new ResponseEntity<String>(HttpStatus.INTERNAL_SERVER_ERROR);
	    }
	      
	    return entity;
	}

	
	@RequestMapping("/storeApplication")
	public void selectStoreApplication() {}
}
