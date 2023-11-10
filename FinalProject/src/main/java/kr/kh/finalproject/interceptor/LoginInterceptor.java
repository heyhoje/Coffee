package kr.kh.finalproject.interceptor;

import java.sql.Date;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.lang.Nullable;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import kr.kh.finalproject.service.MemberService;
import kr.kh.finalproject.vo.ManagerVO;
import kr.kh.finalproject.vo.MemberVO;
import kr.kh.finalproject.vo.UserVO;

public class LoginInterceptor extends HandlerInterceptorAdapter {
	
	@Autowired
	MemberService memberService; // memberService 에게 updateMemberSession 일을 시키려고 추가

	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			@Nullable ModelAndView modelAndView) throws Exception {

		String type = (String) modelAndView.getModel().get("type");
		
		//일반 회원인 경우
		if(type.equals("u")) {
		
			MemberVO user = (MemberVO) modelAndView.getModel().get("user");
			if (user == null) {
				return;
			}
			// 회원 정보가 있으면 세션에 저장
			request.getSession().setAttribute("user", user); 
			
			// 자동 로그인 체크를 했으면
			if(user.isAutoLogin()) {
				String sessionId = request.getSession().getId();

				// 쿠키 생성
				Cookie cookie = new Cookie("loginCookie", sessionId); // new Cookie("쿠키명", "값"). 다른회원과 중복되지 않게 하기 위해서 세션아이디를 씀.
															// autoLoginInterceptor 쿠키명과 같아야 하는지(맞음) 그렇다면 자동로그인꺼를 loginCookie로 변경!
				// 쿠키 경로와 만료 시간 설정
				cookie.setPath("/");
				int time = 60 * 60 * 24 * 7; // 만료시간 MaxAge를 설정하기 위해
				cookie.setMaxAge(time);
				
				// 화면으로 쿠키 정보를 전달
				response.addCookie(cookie);
				
				// DB 회원 정보에 쿠키 정보를 추가
				Date date = new Date(System.currentTimeMillis() + time * 1000); // 만료기간
				user.setMe_session_id(sessionId);
				user.setMe_session_limit(date);
				
				// 여기까지 쓰고 위에 @Autowired MemberService memberService 추가.
				memberService.updateMemberSession(user);
			}
			
		}else if(type.equals("b")) {//사업자 로그인
			ManagerVO user = (ManagerVO) modelAndView.getModel().get("buser"); // 그냥 user에 담아도 되는건지? 일반회원과 구분이 안되지 않나?
			if (user == null) {
				return;
			}
			request.getSession().setAttribute("buser", user); //화면에서 buser로 쓸꺼면 변수값도 buser로 통일 요망
			
		}else if (type.equals("k")) { // 카카오 로그인인 경우 (카카오로그인은 자동로그인을 지원하지 않는다.라면 자동로그인 작업 안해도됨)
	        UserVO user = (UserVO) modelAndView.getModel().get("user");
	        if (user != null) {
	            request.getSession().setAttribute("user", user);
	        }
	    }
		request.getSession().setAttribute("type", type); // type정보도 세션에 담는다?????? 왜????? 
		
		
		/*
		 * MemberVO user = (MemberVO) modelAndView.getModel().get("user"); 
		 * if(!user.isAutoLogin()) { 
		 * 		return; 
		 * }
		 * 
		 * String sessionId = request.getSession().getId(); 
		 * Cookie cookie = new Cookie("FinalProject", sessionId); 
		 * cookie.setPath("/"); 
		 * int time = 60 * 60 * 24 * 7; cookie.setMaxAge(time); 
		 * response.addCookie(cookie);
		 * 
		 * Date date = new Date(System.currentTimeMillis() + time * 1000);
		 * user.setMe_session_id(sessionId); 
		 * user.setMe_session_limit(date);
		 * memberService.updateMemberSession(user);
		 */		
	}
}