package kr.kh.finalproject.interceptor;

import java.util.Date;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.lang.Nullable;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import kr.kh.finalproject.service.ManagerService;
import kr.kh.finalproject.vo.ManagerVO;

public class LoginInterceptor2 extends HandlerInterceptorAdapter {
	@Autowired
	ManagerService managerService;

	@Override
	// 컨트롤러에서 빠져 나올 때 실행
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			@Nullable ModelAndView modelAndView) throws Exception {

		// 회원 정보가 있는지 확인 => 컨트롤러가 model에 다음 user 정보가 있는지 확인
		ManagerVO user2 = (ManagerVO) modelAndView.getModel().get("buser");
		if (user2 == null) {
			return;
		}

		// 있으면 세션에 저장, 저장한 이름을 잘 기억 => 곳곳에서 사용될 예정
		request.getSession().setAttribute("buser", user2);
		// 자동 로그인 체크를 안했으면
		if (!user2.isAutoLogin()) {
			return;
		}

		// 자동 로그인 체크를 했으면
		String sessionId = request.getSession().getId();
		// 쿠키 생성
		Cookie cookie = new Cookie("FinalProject", sessionId);
		// 쿠키 경로와 만료 시간을 설정
		cookie.setPath("/");
		int time = 60 * 60 * 24 * 7; // 60 * 60 * 24 * 7 == 7일을 초로 환산
		cookie.setMaxAge(time);
		// 화면으로 쿠키 정보를 전달
		response.addCookie(cookie);

		// DB 회원 정보에 쿠키 정보를 추가
		Date date = new Date(System.currentTimeMillis() + time * 1000);
		user2.setBm_session_id(sessionId);
		user2.setBm_session_limit(date);
		managerService.updateMemberSession(user2);
	}
}