package com.rundering.customer;

import java.sql.SQLException;

import javax.annotation.Resource;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.rundering.dto.BranchApplicationVO;
import com.rundering.service.BranchApplicationService;

@RequestMapping("/branchapplication")
@Controller
public class BranchApplicationController {
	
	@Resource(name="branchApplicationService")
	private BranchApplicationService branchApplicationService;
	
	
	@RequestMapping("/regist")
	public void branchApplication() {}
	
	@RequestMapping("/registform")
	public ResponseEntity<String> insertBranchApp(BranchApplicationVO bv) throws Exception {
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
