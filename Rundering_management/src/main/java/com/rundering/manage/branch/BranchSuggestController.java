package com.rundering.manage.branch;

import java.io.File;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

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

import com.rundering.dto.EmployeesVO;
import com.rundering.dto.SuggestVO;
import com.rundering.manage.Criteria;
import com.rundering.service.SuggestService;
import com.rundering.util.MakeFileName;

@Controller
@RequestMapping("/branch/suggest")
public class BranchSuggestController {
	@Autowired
	SuggestService suggestService;

	@RequestMapping(value = "/list")
	private ModelAndView suggestList(Criteria cri, ModelAndView mnv) throws Exception {
		String url = "branch/suggest/suggest_list";

		Map<String, Object> dataMap = suggestService.getSuggestList(cri);
		mnv.addObject("dataMap", dataMap);
		mnv.setViewName(url);

		return mnv;
	}

	@RequestMapping(value = "/detail")
	private ModelAndView suggestDetail(int sno, @RequestParam(defaultValue = "") String from,
			HttpServletRequest request, ModelAndView mnv, HttpSession session) throws SQLException {

		String url = "branch/suggest/suggest_detail";

		SuggestVO suggest = null;

		if (!from.equals("list")) {
			suggest = suggestService.getSuggestModify(sno);
		} else {
			suggest = suggestService.getSuggest(sno);
			
			EmployeesVO employees = (EmployeesVO) session.getAttribute("loginEmployee");
			if (employees.getBranchCode().equals("000000")) {
				suggest = suggestService.getCheck(sno);
			}
			
			url = "redirect:/branch/suggest/detail?sno=" + sno;
		}

		mnv.addObject("suggest", suggest);
		mnv.setViewName(url);

		return mnv;
	}

	@RequestMapping("/modifyForm")
	public ModelAndView modifyForm(int sno, ModelAndView mnv) throws Exception {

		String url = "branch/suggest/suggest_modify";

		SuggestVO suggest = suggestService.getSuggestModify(sno);

		mnv.addObject("suggest", suggest);
		mnv.setViewName(url);

		return mnv;
	}

	@RequestMapping(value = "/modify", method = RequestMethod.POST)
	public String modifyPost(SuggestVO suggest, HttpServletRequest request, RedirectAttributes rttr) throws Exception {

		String url = "redirect:/branch/suggest/detail";

		suggestService.modify(suggest);

		rttr.addAttribute("sno", suggest.getSno());
		rttr.addFlashAttribute("from", "modify");

		return url;
	}

	@RequestMapping("/registForm")
	private String suggestRegistForm() {

		String url = "branch/suggest/suggest_regist";

		return url;
	}

	@RequestMapping(value = "/regist")
	public String suggestRegist(SuggestVO suggest, HttpServletRequest request, RedirectAttributes rttr)
			throws Exception {

		String url = "redirect:/branch/suggest/list";

		suggestService.regist(suggest);

		rttr.addFlashAttribute("from", "regist");

		return url;
	}

	@RequestMapping(value = "/remove", method = RequestMethod.GET)
	public String remove(int sno, RedirectAttributes rttr) throws Exception {
		String url = "redirect:/branch/suggest/detail";

		suggestService.remove(sno);

		rttr.addFlashAttribute("from", "remove");
		rttr.addAttribute("sno", sno);

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
