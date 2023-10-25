package kr.kh.finalproject.interceptor;

import java.util.Date;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.lang.Nullable;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import kr.kh.finalproject.service.MemberService;
import kr.kh.finalproject.vo.BusinessMemberVO;
import kr.kh.finalproject.vo.MemberVO;

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
		}else if(type.equals("b")) {
			BusinessMemberVO user = (BusinessMemberVO) modelAndView.getModel().get("buser");
			if (user == null) {
				return;
			}
			request.getSession().setAttribute("buser", user);
		}
		request.getSession().setAttribute("type", type);
		
		
		/*
		// �ڵ� �α��� üũ�� ��������
		if (!user.isAutoLogin()) {
			return;
		}

		// �ڵ� �α��� üũ�� ������
		String sessionId = request.getSession().getId();
		// ��Ű ����
		Cookie cookie = new Cookie("FinalProject", sessionId);
		// ��Ű ��ο� ���� �ð��� ����
		cookie.setPath("/");
		int time = 60 * 60 * 24 * 7; // 60 * 60 * 24 * 7 == 7���� �ʷ� ȯ��
		cookie.setMaxAge(time);
		// ȭ������ ��Ű ������ ����
		response.addCookie(cookie);

		// DB ȸ�� ������ ��Ű ������ �߰�
		Date date = new Date(System.currentTimeMillis() + time * 1000);
		user.setMe_session_id(sessionId);
		user.setMe_session_limit(date);
		memberService.updateMemberSession(user);
		*/
	}
}