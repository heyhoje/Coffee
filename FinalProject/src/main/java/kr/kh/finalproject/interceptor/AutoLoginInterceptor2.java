package kr.kh.finalproject.interceptor;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;
import org.springframework.web.util.WebUtils;

import kr.kh.finalproject.service.ManagerService;
import kr.kh.finalproject.vo.ManagerVO;

public class AutoLoginInterceptor2 extends HandlerInterceptorAdapter {

	@Autowired
	ManagerService managerService;
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		
		HttpSession session = request.getSession();
		ManagerVO buser = (ManagerVO)session.getAttribute("buser");
		
		//이미 로그인 됨 == 자동 로그인 안해도 됨
		if(buser != null) {
			return true;
		}
		//쿠키 정보를 가져옴
		Cookie cookie = WebUtils.getCookie(request, "bmLoginCookie");
		//쿠키 정보가 없음 == 자동 로그인 안해도 됨
		if(cookie == null) {
			return true;
		}
		
		//쿠키값과 같은 정보를 가진 회원 정보를 가져옴
		buser = managerService.getBMemberBySessionId(cookie.getValue());
		if(buser != null) {
			session.setAttribute("buser", buser);
		}
		return true;
	}
}