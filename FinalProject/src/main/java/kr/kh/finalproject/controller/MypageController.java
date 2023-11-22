package kr.kh.finalproject.controller;


import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import kr.kh.finalproject.service.InterestService;
import kr.kh.finalproject.service.MemberService;
import kr.kh.finalproject.vo.InterestVO;
import kr.kh.finalproject.vo.MemberVO;


@Controller
public class MypageController {
	
	@Autowired MemberService memberService;
	@Autowired InterestService interestService;
	
	@RequestMapping(value = "/member/mypageHome", method = RequestMethod.GET)
	public String mypageHome() {
		// 회원 ID를 가져와서 해당 회원의 관심사를 웹페이지에 표시하

	    // 관심 브랜드 가져오기

	    // 모델에 회원 정보와 관심 브랜드 추가
		return "/member/mypageHome";
	}
}
