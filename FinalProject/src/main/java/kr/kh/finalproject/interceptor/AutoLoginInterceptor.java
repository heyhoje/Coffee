package kr.kh.finalproject.interceptor;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;
import org.springframework.web.util.WebUtils;

import kr.kh.finalproject.service.MemberService;
import kr.kh.finalproject.vo.MemberVO;

public class AutoLoginInterceptor extends HandlerInterceptorAdapter {

	@Autowired
	MemberService memberService;
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		HttpSession session = request.getSession();
		MemberVO user = (MemberVO)session.getAttribute("user");
		
		//이미 로그인 됨 == 자동 로그인 안해도 됨
		if(user != null) {
			return true;
		}
		//쿠키 정보를 가져옴
		Cookie cookie = WebUtils.getCookie(request, "loginCookie"); // 로그인 인터셉터의 '쿠키이름'과 통일
		//쿠키 정보가 없음 == 자동 로그인 안해도 됨
		if(cookie == null) {
			return true;
		}
		
		//쿠키값과 같은 정보를 가진 회원 정보를 가져옴
		user = memberService.getMemberBySessionId(cookie.getValue());
		if(user != null) {
			session.setAttribute("user", user);
		}
		return true;
	}
}
