package kr.kh.finalproject.controller;


import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import kr.kh.finalproject.service.MemberService;
import kr.kh.finalproject.util.Message;
import kr.kh.finalproject.vo.MemberVO;

@Controller

public class MemberController {

	@Autowired MemberService memberService;
	
	@RequestMapping(value="/member/signup2", method=RequestMethod.GET)
	public String signup() {
		
		return "/member/signup2";
	}
	@RequestMapping("/member/signup2", method=RequestMethod.POST)
	public String signupPost(MemberVO member, Model model) {
		Message msg = new Message("/member/signup2", "회원가입에 실패했습니다.");
		if(memberService.signup(member)) {
			msg = new Message ("/", "회원가입에 성공했습니다.");
		}
		model.addAttribute("msg",msg);
		return "message";
	}

	@RequestMapping(value="/kakaoLogin", method=RequestMethod.GET)
	public String kakaoLogin(@RequestParam(value = "code", required = false) String code) throws Exception {
		System.out.println("#########" + code);
		String access_Token = ms.getAccessToken(code);
		/*
		 * 리턴값의 testPage는 아무 페이지로 대체해도 괜찮습니다.
		 * 없는 페이지를 넣어도 무방합니다.
		 * 404가 떠도 제일 중요한건 #########인증코드 가 잘 출력이 되는지가 중요하므로 너무 신경 안쓰셔도 됩니다.
		 */
		HashMap<String, Object> userInfo = ms.getUserInfo(access_Token);
		System.out.println("###access_Token#### : " + access_Token);
		System.out.println("###nickname#### : " + userInfo.get("nickname"));
		System.out.println("###email#### : " + userInfo.get("email"));
		return "main/index";
	}

}
