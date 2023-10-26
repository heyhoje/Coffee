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

import kr.kh.finalproject.vo.MemberVO;
import kr.kh.finalproject.service.MemberService;
import kr.kh.finalproject.vo.MemberVO;

@Controller

public class MemberController {

	@Autowired MemberService memberService;
	//�쉶�썝媛��엯 �럹�씠吏�
	@RequestMapping(value="/member/signup2", method=RequestMethod.GET)
	public String signup() {
		
		return "/member/signup2";
	}
	//회원가입 기능구현 시작
	@RequestMapping(value="/member/signup2", method=RequestMethod.POST)
	public String signupPost(MemberVO member, Model model) {
		boolean res = memberService.signup(member);
		if(res) {
			model.addAttribute("msg", "회원가입 성공!");
			model.addAttribute("url", "");
		} else {
			model.addAttribute("msg", "회원가입 실패!");
			model.addAttribute("url", "/member/signup2");
		}
		return "/main/message";
	}
	//비밀번호 찾기 페이지

	@RequestMapping(value="/member/forgotpw", method=RequestMethod.GET)
	public String forgotpw() {
		
		return "/member/forgotpw";
	}


	@ResponseBody
	@PostMapping("/member/id/check")
	public boolean idCheck(@RequestParam("id") String id){
		return memberService.checkId(id);
	}
	
//	회원 로그인	
	@GetMapping("/member/login")
	public String login() {
		return "/member/login";
	}
	


	@PostMapping("/member/login")
	public String loginPost(Model model, MemberVO member) {
		//입력받은 회원정보와 일치하는 회원 정보가 있으면 가져오라고 요청
		System.out.println(member);
		MemberVO user = memberService.login(member);
		//가져왔으면 => 로그인 성공하면 
		if(user != null) {
			model.addAttribute("user", user);
			model.addAttribute("type", "u");
			model.addAttribute("msg", "로그인 성공!");
			model.addAttribute("url", "");
			//화면에서 보낸 자동 로그인 체크 여부를 user에 적용
			user.setAutoLogin(member.isAutoLogin());
		}else {
			model.addAttribute("msg", "아이디 또는 비밀번호가 잘못되었습니다.");
			model.addAttribute("url", "/member/login");
		}
		return "/main/message";
	}	
	
	@PostMapping("/member/logout")
	public String logout(Model model, HttpSession session) {
		Object user = session.getAttribute("user");
		session.removeAttribute("user");
		
		/*if(user != null) {
			user.setMe_session_limit(null);
			memberService.updateMemberSession(user);
		}*/
		
		model.addAttribute("msg", "로그아웃 성공!");
		model.addAttribute("url", "");
		return "/main/message";
	}
}