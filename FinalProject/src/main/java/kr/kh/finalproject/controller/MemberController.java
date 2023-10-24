package kr.kh.finalproject.controller;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import kr.kh.finalproject.service.MemberService;
import kr.kh.finalproject.vo.MemberVO;

@Controller

public class MemberController {

	@Autowired 
	MemberService memberService;
	
	//회원가입 페이지
	@RequestMapping(value="/member/signup2", method=RequestMethod.GET)
	public String signup() {
		
		return "/member/signup2";
	}
	//회원가입 기능구현 시작
	
	//비밀번호 찾기 페이지
	@RequestMapping(value="/member/forgotpw", method=RequestMethod.GET)
	public String forgotpw() {
		
		return "/member/forgotpw";
	}


}
