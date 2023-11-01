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
	MemberService memberService;

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
			request.getSession().setAttribute("user", user);
			
		}else if(type.equals("b")) {//사업자 로그인
			ManagerVO user = (ManagerVO) modelAndView.getModel().get("buser");
			if (user == null) {
				return;
			}
			request.getSession().setAttribute("buser", user);
			
		}else if (type.equals("k")) { // 카카오 로그인인 경우
	        UserVO user = (UserVO) modelAndView.getModel().get("user");
	        if (user != null) {
	            request.getSession().setAttribute("user", user);
	        }
	    }
		request.getSession().setAttribute("type", type);
		
		
		/*
		 * MemberVO user = (MemberVO) modelAndView.getModel().get("user"); if
		 * (!user.isAutoLogin()) { return; }
		 * 
		 * String sessionId = request.getSession().getId(); Cookie cookie = new
		 * Cookie("FinalProject", sessionId); cookie.setPath("/"); int time = 60 * 60 *
		 * 24 * 7; cookie.setMaxAge(time); response.addCookie(cookie);
		 * 
		 * Date date = new Date(System.currentTimeMillis() + time * 1000);
		 * user.setMe_session_id(sessionId); user.setMe_session_limit(date);
		 * memberService.updateMemberSession(user);
		 */		
	}
}