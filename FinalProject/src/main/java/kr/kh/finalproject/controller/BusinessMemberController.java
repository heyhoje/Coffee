package kr.kh.finalproject.controller;


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

import kr.kh.finalproject.vo.BusinessMemberVO;
import kr.kh.finalproject.service.BusinessMemberService;

@Controller

public class BusinessMemberController {

	@Autowired BusinessMemberService businessMemberService;

	@RequestMapping(value="/member/forgotpw2", method=RequestMethod.GET)
	public String forgotpw2() {
		
		return "/member/forgotpw";
	}

	@ResponseBody
	@PostMapping("/member/id/check2")
	public boolean idCheck2(@RequestParam("bid") String bid){
		return businessMemberService.checkId(bid);
	}
	
//	사업자 로그인	
	@GetMapping("/member/login2")
	public String login2() {
		return "/member/login";
	}
	

	@PostMapping("/member/login2")
	public String loginPost(Model model, BusinessMemberVO businessMember) {
		//입력받은 회원정보와 일치하는 회원 정보가 있으면 가져오라고 요청
		System.out.println(businessMember);
		BusinessMemberVO user2 = businessMemberService.login(businessMember);
		//가져왔으면 => 로그인 성공하면 
		if(user2 != null) {
			model.addAttribute("buser", user2);
			model.addAttribute("type", "b");
			model.addAttribute("msg", "로그인 성공!");
			model.addAttribute("url", "/business/home");
			//화면에서 보낸 자동 로그인 체크 여부를 user에 적용
			user2.setAutoLogin(businessMember.isAutoLogin());
		}else {
			model.addAttribute("msg", "로그인 실패!");
			model.addAttribute("url", "/member/login");
		}
		return "/main/message";
	}	
	
	@PostMapping("/member/logout2")
	public String logout(Model model, HttpSession session) {
		BusinessMemberVO user2 = (BusinessMemberVO)session.getAttribute("buser");
		session.removeAttribute("buser");
		
		if(user2 != null) {
			user2.setBm_session_limit(null);
			businessMemberService.updateMemberSession(user2);
		}
		
		model.addAttribute("msg", "로그아웃 성공!");
		model.addAttribute("url", "");
		return "/main/message";
	}
}