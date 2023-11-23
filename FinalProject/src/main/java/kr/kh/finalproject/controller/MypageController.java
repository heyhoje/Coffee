package kr.kh.finalproject.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import kr.kh.finalproject.service.InterestService;
import kr.kh.finalproject.service.MemberService;
import kr.kh.finalproject.vo.MemberVO;


@Controller
public class MypageController {
	
	@Autowired MemberService memberService;
	@Autowired InterestService interestService;
	
	@RequestMapping(value = "/member/mypageHome", method = RequestMethod.GET)
	public String mypageHome(Model model, HttpSession session) throws Exception {
		// 세션에서 현재 로그인한 회원의 정보 가져오기
		MemberVO user = (MemberVO) session.getAttribute("user");	    
	    if (user != null) {
	        // 회원의 ID를 가져오기
	        String me_user_id = user.getMe_user_id();
	        
	        try {
	            // 로그인된 회원의 관심사 리스트를 가져오기
	            List<String> memberInterests = interestService.getMemberInterests(me_user_id);
	            // 가져온 관심사를 모델에 추가하여 웹 페이지에 전달
	            model.addAttribute("memberInterests", memberInterests);
	            System.out.println(memberInterests);
	        } catch (Exception e) {
	            // 예외 처리
	            e.printStackTrace();
	            // 필요한 예외 처리 로직 추가
	        }
	    }
		return "/member/mypageHome";
	}
}