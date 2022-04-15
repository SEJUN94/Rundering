package com.rundering.manage.branch;

import java.io.File;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.rundering.dto.AnonymousBoardVO;
import com.rundering.manage.Criteria;
import com.rundering.service.AnonymousServiceImpl;
import com.rundering.util.MakeFileName;

@Controller
@RequestMapping("/branch/suggest")
public class BranchSuggestController {
	@Autowired
	AnonymousServiceImpl anonymousService;

	@RequestMapping(value = "/list")
	private ModelAndView suggestList(Criteria cri, ModelAndView mnv) throws Exception {
		String url = "branch/suggest/suggest_list";

		Map<String, Object> dataMap = anonymousService.getAnonymousList(cri);
		mnv.addObject("dataMap", dataMap);
		mnv.setViewName(url);

		return mnv;
	}

	@RequestMapping(value = "/detail")
	private ModelAndView suggestDetail(int ano, @RequestParam(defaultValue = "") String from,
			HttpServletRequest request, ModelAndView mnv) throws SQLException {

		String url = "branch/suggest/suggest_detail";

		AnonymousBoardVO anonymous = null;

		if (!from.equals("list")) {
			anonymous = anonymousService.getAnonymousModify(ano);
		} else {
			anonymous = anonymousService.getAnonymous(ano);
			url = "redirect:/branch/suggest/detail?ano=" + ano;
		}

		mnv.addObject("anonymous", anonymous);
		mnv.setViewName(url);

		return mnv;
	}

	@RequestMapping("/modifyForm")
	public ModelAndView modifyForm(int ano, ModelAndView mnv) throws Exception {

		String url = "branch/suggest/suggest_modify";

		AnonymousBoardVO anonymous = anonymousService.getAnonymousModify(ano);

		mnv.addObject("anonymous", anonymous);
		mnv.setViewName(url);

		return mnv;
	}

	@RequestMapping(value = "/modify", method = RequestMethod.POST)
	public String modifyPost(AnonymousBoardVO anonymous, HttpServletRequest request, RedirectAttributes rttr)
			throws Exception {

		String url = "redirect:/branch/suggest/detail";
				
		//<p> tag remove
//		anonymous.setContent((String)request.getAttribute("XSScontent")); 
		
		anonymousService.modify(anonymous);

		rttr.addAttribute("ano", anonymous.getAno());
		rttr.addFlashAttribute("from", "modify");

		return url;
	}

	@RequestMapping("/registForm")
	private String suggestRegistForm() {

		String url = "branch/suggest/suggest_regist";

		return url;
	}

	@RequestMapping(value = "/regist")
	public String suggestRegist(AnonymousBoardVO anonymous, HttpServletRequest request, RedirectAttributes rttr)
			throws Exception {

		String url = "redirect:/branch/suggest/list";

		// <p> tag remove
		/* anonymous.setContent((String)request.getAttribute("XSStitle")); */

		anonymousService.regist(anonymous);

		rttr.addFlashAttribute("from", "regist");

		return url;
	}

	@RequestMapping(value = "/remove", method = RequestMethod.GET)
	public String remove(int ano, RedirectAttributes rttr) throws Exception {
		String url = "redirect:/branch/suggest/detail";

		anonymousService.remove(ano);

		rttr.addFlashAttribute("from", "remove");
		rttr.addAttribute("ano", ano);

		return url;
	}

	@Resource(name = "boardPath")
	private String boardPath;

	@ResponseBody
	@RequestMapping(value = "/suggest/upload", produces = "application/json;charset=UTF-8")
	private ResponseEntity<HashMap<String, String>> savePicture(@RequestParam("file") MultipartFile multi,
			String oldPicture) throws Exception {

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
			dataMap.put("originalFileName", multi.getOriginalFilename());
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
		} else {
			entity = new ResponseEntity<HashMap<String, String>>(dataMap, HttpStatus.INTERNAL_SERVER_ERROR);
		}

		return entity;
	}

}
