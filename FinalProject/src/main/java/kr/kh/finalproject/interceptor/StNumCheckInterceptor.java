package kr.kh.finalproject.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

public class StNumCheckInterceptor implements HandlerInterceptor {
	
	@Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
        HttpSession session = request.getSession();
        Integer loggedInStNum = (Integer) session.getAttribute("loggedInStNum");
        int requestedStNum = Integer.parseInt(request.getAttribute("st_num").toString());

        System.out.println("loggedInStNum: " + loggedInStNum);
        System.out.println("requestedStNum: " + requestedStNum);
        // 로그인한 사업자의 st_num과 요청된 페이지의 st_num을 비교하여 접근 제어
        if (loggedInStNum == null || loggedInStNum != requestedStNum) {
            response.sendRedirect(request.getContextPath() + "/access-denied"); // 접근 거부 페이지로 리다이렉트
            return false;
        }

        return true;
    }
}

