package kr.kh.finalproject.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.kh.finalproject.service.ManagerService;
import kr.kh.finalproject.vo.ManagerVO;

@Controller
public class ManagerController {
	
	@Autowired
	ManagerService managerService;
	
	@RequestMapping(value="/manager/signup2", method=RequestMethod.GET)
	public String signup() {
		
		return "/manager/signup2";
	}
	
	@RequestMapping(value="/manager/signup2", method=RequestMethod.POST)
	public String managerRegister(ManagerVO manager, Model model) {
		boolean res = managerService.managerRegister(manager);
		if(res) {
			model.addAttribute("msg", "회원가입 성공!");
			model.addAttribute("url", "");
		} else {
			model.addAttribute("msg", "회원가입 실패!");
			model.addAttribute("url", "/manager/signup2");
		}
		return "/main/message";
	}
	
	@ResponseBody
	@PostMapping("/manager/id/check")
	public boolean manageridCheck(@RequestParam("id") String id) {
		return managerService.manageridCheck(id);
	}
}
