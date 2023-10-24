package kr.kh.finalproject.interceptor;

import java.util.Date;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.lang.Nullable;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import kr.kh.finalproject.service.BusinessMemberService;
import kr.kh.finalproject.vo.BusinessMemberVO;

public class LoginInterceptor2 extends HandlerInterceptorAdapter {
	@Autowired
	BusinessMemberService businessMemberService;

	@Override
	// ��Ʈ�ѷ����� ���� ���� �� ����
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			@Nullable ModelAndView modelAndView) throws Exception {

		// ȸ�� ������ �ִ��� Ȯ�� => ��Ʈ�ѷ��� model�� ���� user ������ �ִ��� Ȯ��
		BusinessMemberVO user2 = (BusinessMemberVO) modelAndView.getModel().get("user2");
		if (user2 == null) {
			return;
		}

		// ������ ���ǿ� ����, ������ �̸��� �� ��� => �������� ���� ����
		request.getSession().setAttribute("user2", user2);
		// �ڵ� �α��� üũ�� ��������
		if (!user2.isAutoLogin()) {
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
		user2.setBm_session_id(sessionId);
		user2.setBm_session_limit(date);
		businessMemberService.updateMemberSession(user2);
	}
}