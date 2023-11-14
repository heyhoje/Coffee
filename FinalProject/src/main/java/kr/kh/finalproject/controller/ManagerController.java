package kr.kh.finalproject.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.kh.finalproject.pagination.Criteria;
import kr.kh.finalproject.pagination.PageMaker;
import kr.kh.finalproject.service.ManagerService;
import kr.kh.finalproject.vo.ManagerVO;

@Controller
public class ManagerController {

	@Autowired
	ManagerService managerService;

	@RequestMapping(value = "/manager/signup2", method = RequestMethod.GET)
	public String signup() {

		return "/manager/signup2";
	}

	@RequestMapping(value = "/manager/signup2", method = RequestMethod.POST)
	public String managerRegister(ManagerVO manager, Model model) {
		boolean res = managerService.managerRegister(manager);
		if (res) {
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

	@RequestMapping(value = "/member/forgotpw2", method = RequestMethod.GET) // 왜 멤버/비번2 로 경로설정되있는지?
	public String forgotpw2() {

		return "/member/forgotpw";
	}

	// 사업자로그인
	@GetMapping("/member/login2")
	public String login() {
		return "/member/login";
	}

	@PostMapping("/member/login2")
	public String loginPost(Model model, ManagerVO manager) {
		// 입력받은 회원정보와 일치하는 회원 정보가 있으면 가져오라고 요청
		System.out.println(manager);
		ManagerVO buser = managerService.login(manager);
		// 가져왔으면 => 로그인 성공하면
		if (buser != null) {
			model.addAttribute("buser", buser);
			model.addAttribute("type", "b");
			model.addAttribute("msg", "로그인 성공!");
			model.addAttribute("url", "business/home");
			
			// 화면에서 보낸 자동 로그인 체크 여부를 user에 적용
			buser.setAutoLogin(manager.isAutoLogin());
			
		} else {
			model.addAttribute("msg", "아이디 또는 비밀번호가 잘못되었습니다.");
			model.addAttribute("url", "/member/login");
		}
		return "/main/message";
	}
	
	@PostMapping("/member/logout2")
	public String logout(Model model, HttpSession session) {
		
//		Object user2 = session.getAttribute("buser");
//		session.removeAttribute("buser");
		
		// session_limit null값, 없데이트, 세션에서 user정보 제거
		ManagerVO buser = (ManagerVO)session.getAttribute("buser");
		
		buser.setBm_session_limit(null);
		managerService.updateBMemberSession(buser); // 자동로그인을 안하기 위해
		
		session.removeAttribute("buser"); // 일반 로그아웃을 위해

		/*
		 * if(user2 != null) { user2.setMe_session_limit(null);
		 * managerService.updateMemberSession(user2); }
		 */

		model.addAttribute("msg", "로그아웃 성공!");
		model.addAttribute("url", "");
		return "/main/message";
	}

}

