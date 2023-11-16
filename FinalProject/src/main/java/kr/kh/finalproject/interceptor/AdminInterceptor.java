package kr.kh.finalproject.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.HandlerInterceptor;

import kr.kh.finalproject.vo.MemberVO;

public class AdminInterceptor implements HandlerInterceptor{

	
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
        // preHandle 메서드는 컨트롤러가 호출되기 전에 실행됩니다.
        // 예를 들어, 어드민 권한 체크 등을 수행할 수 있습니다.
		
		// System.out.println("AdminInterceptor preHandle: " + request.getRequestURI());
		 
		HttpSession session = request.getSession();
		MemberVO user = (MemberVO)session.getAttribute("user"); // loginInterceptor에서 memberVO를 저장한 값으로 찾아야함.
		
		if(user == null|| !"admin".equals(user.getMe_authority())) {
			System.out.println("접근에 실패했습니다."); // 실패시키고 싶다.......!!!!!!!
			response.sendRedirect(request.getContextPath()+"/"); // 인터셉터는 <c:url>이나 컨텍스트패스를 모르기 때문에 리퀘스트로 붙여줘야함!
			return false;
		}
		// System.out.println("관리자 모드로 접속했습니다.");
		return true;
	}
}
