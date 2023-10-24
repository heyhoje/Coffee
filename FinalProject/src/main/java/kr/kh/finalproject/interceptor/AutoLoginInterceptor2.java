package kr.kh.finalproject.interceptor;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;
import org.springframework.web.util.WebUtils;

import kr.kh.finalproject.service.BusinessMemberService;
import kr.kh.finalproject.vo.BusinessMemberVO;

public class AutoLoginInterceptor2 extends HandlerInterceptorAdapter {

	@Autowired
	BusinessMemberService businessMemberService;
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		HttpSession session = request.getSession();
		BusinessMemberVO user2 = (BusinessMemberVO)session.getAttribute("user2");
		
		//�̹� �α��� �� == �ڵ� �α��� ���ص� ��
		if(user2 != null) {
			return true;
		}
		//��Ű ������ ������
		Cookie cookie = WebUtils.getCookie(request, "FinalProject");
		//��Ű ������ ���� == �ڵ� �α��� ���ص� ��
		if(cookie == null) {
			return true;
		}
		
		//��Ű���� ���� ������ ���� ȸ�� ������ ������
		user2 = businessMemberService.getMemberBySessionId(cookie.getValue());
		if(user2 != null) {
			session.setAttribute("user2", user2);
		}
		return true;
	}
}