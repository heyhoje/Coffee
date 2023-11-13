package kr.kh.finalproject.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DuplicateKeyException;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.kh.finalproject.service.MemberService;
import kr.kh.finalproject.vo.MemberVO;
import kr.kh.finalproject.vo.UserVO;

public class KakaoController {
	@Autowired MemberService memberService;
		//카카오
		@RequestMapping("/kakaoLoginCallback")
	    public String kakaoLoginCallback(Model model, HttpServletRequest request) {
			try {
				String kakaoId = request.getParameter("kakaoId");
		        String email = request.getParameter("email");
		        String name = request.getParameter("name");
		        String phone_number = request.getParameter("phone_number");
		
		        // 카카오 로그인 정보를 User 테이블에 삽입
		        UserVO user = new UserVO();
		        user.setUser_id(kakaoId);
		        user.setUser_phone(phone_number);
		        user.setUser_aorb("회원"); // user_aorb 값을 설정
		        System.out.println(user);
		        // User 정보를 추가하는 메서드를 호출
		        memberService.insertUserKakaoInfo(user);
		
		        // 카카오 로그인 정보를 Member 테이블에 삽입
		        MemberVO member = new MemberVO();
		        member.setKakao_user_id(kakaoId);
		        member.setKakao_email(email);
		        member.setKakao_name(name);
		        memberService.insertMemberKakao(member);
		        
		        return "/"; // 홈 페이지로 리다이렉트
		    } catch (DuplicateKeyException e) {
		        // 중복 키 예외 처리
		        model.addAttribute("error", "이미 가입된 사용자입니다.");
		        return "/"; // 에러 페이지로 리다이렉트 또는 해당 메시지를 화면에 표시
		    } catch (Exception e) {
		        // 기타 예외 처리
		        model.addAttribute("error", "알 수 없는 오류가 발생했습니다.");
		        return "/"; // 에러 페이지로 리다이렉트 또는 해당 메시지를 화면에 표시
		    }
		}
}
