package kr.kh.finalproject.controller;


import java.util.HashMap;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

@Controller

public class MemberController {

	@RequestMapping(value="/member/signup", method=RequestMethod.GET)
	public String signup() {
		
		return "/member/signup";
	}

}
