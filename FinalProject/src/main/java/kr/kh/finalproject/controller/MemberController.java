package kr.kh.finalproject.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class MemberController {

	@RequestMapping(value="/member/signup", method=RequestMethod.GET)
	public String signup() {
		
		return "/member/signup";
	}
	@RequestMapping(value="/member/signup2", method=RequestMethod.GET)
	public String signup2() {
		
		return "/member/signup2";
	}
}