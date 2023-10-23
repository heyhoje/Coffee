package kr.kh.finalproject.controller;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import kr.kh.finalproject.service.MemberService;

@Controller

public class MemberController {

	@Autowired MemberService memberService;
	//�쉶�썝媛��엯 �럹�씠吏�
	@RequestMapping(value="/member/signup2", method=RequestMethod.GET)
	public String signup() {
		
		return "/member/signup2";
	}
	//鍮꾨�踰덊샇 李얘린 �럹�씠吏�
	@RequestMapping(value="/member/forgotpw", method=RequestMethod.GET)
	public String forgotpw() {
		
		return "/member/forgotpw";
	}

    @RequestMapping(value = "/member/login", method = RequestMethod.POST)
    public String processLogin(@RequestParam String username, @RequestParam String password, Model model) {
        if (memberService.authenticateUser(username, password)) {
            // 로그인 성공
            return "/main/index"; // 로그인 후 리다이렉트할 페이지
        } else {
            // 로그인 실패
            model.addAttribute("error", "Invalid credentials");
            return "/member/login";
        }
    }
	/*
	 * @RequestMapping("/member/signup2", method=RequestMethod.POST) public String
	 * signupPost(MemberVO member, Model model) { Message msg = new
	 * Message("/member/signup2", "�쉶�썝媛��엯�뿉 �떎�뙣�뻽�뒿�땲�떎."); if(memberService.signup(member))
	 * { msg = new Message ("/", "�쉶�썝媛��엯�뿉 �꽦怨듯뻽�뒿�땲�떎."); } model.addAttribute("msg",msg);
	 * return "message"; }
	 */

}