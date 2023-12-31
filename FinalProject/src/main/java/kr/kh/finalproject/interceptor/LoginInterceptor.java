package kr.kh.finalproject.interceptor;

import java.sql.Date;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.lang.Nullable;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import kr.kh.finalproject.service.ManagerService;
import kr.kh.finalproject.service.MemberService;
import kr.kh.finalproject.vo.KakaoVO;
import kr.kh.finalproject.vo.ManagerVO;
import kr.kh.finalproject.vo.MemberVO;
import kr.kh.finalproject.vo.UserVO;

public class LoginInterceptor extends HandlerInterceptorAdapter {
	
	@Autowired
	MemberService memberService; // memberService 에게 updateMemberSession 일을 시키려고 추가
	@Autowired
	ManagerService managerService; // managerService - updateBmemberSession

	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			@Nullable ModelAndView modelAndView) throws Exception {

		String type = (String) modelAndView.getModel().get("type");
		
		//일반 회원인 경우
		if(type.equals("u")) {
		
			MemberVO user = (MemberVO) modelAndView.getModel().get("user");
			
			if (user != null) {
				
				// 회원 정보가 있으면 세션에 저장
				request.getSession().setAttribute("user", user); 
				
					// HttpSession session = request.getSession();
					// session.setAttribute("user", user);
				
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
					
				} else {					
					// 자동로그인no -> 일반로그인 했을 때도 세션에 세션아이디를 업데이트 해줌
					// (이유) 중복 로그인으로 상품 주문하는 것을 막기 위해
					String sessionId = request.getSession().getId();
					user.setMe_session_id(sessionId);
					memberService.updateMemberSession(user);
					
				}
			
			}
			
		}else if(type.equals("b")) {//사업자 로그인
			// 회원 정보가 있는지 확인 => 컨트롤러가 model에 다음 user2 정보가 있는지 확인
			ManagerVO buser = (ManagerVO) modelAndView.getModel().get("buser");
			if (buser == null) {
				return;
			}
			
			// (!null) 있으면 세션에 저장, 저장한 이름을 잘 기억 => 곳곳에서 사용될 예정
			request.getSession().setAttribute("buser", buser);
			// 자동로그인 체크를 안했으면
			if(!buser.isAutoLogin()) {
				return;
			}
			// 했으면 세션아이디 저장? 생성?
			String bmSessionId = request.getSession().getId();
//			System.out.println("bmSesstionId : " + bmSessionId);
			String getSessionSt_num = managerService.getSesstionSt_num(buser);
//			System.out.println("getSessionSt_num: " + getSessionSt_num);
			// 쿠키 생성
			Cookie cookie = new Cookie("bmLoginCookie", bmSessionId);
			
			// 쿠키 경로와 만료 시간을 설정
			cookie.setPath("/");
			int time = 60 * 60 * 24 * 7;
			cookie.setMaxAge(time);
			
			// 화면으로 쿠키 정보를 전달
			response.addCookie(cookie);
			
			// DB 회원 정보에 쿠키 정보를 전달
			Date date = new Date(System.currentTimeMillis() + time * 1000);
			buser.setBm_session_st_num(getSessionSt_num);
			buser.setBm_session_id(bmSessionId);
			buser.setBm_session_limit(date);
			
			// 서비스에 업데이트 일시킴
			managerService.updateBMemberSession(buser);
			
		}else if (type.equals("k")) { // 카카오 로그인인 경우 (카카오로그인은 자동로그인을 지원하지 않는다.라면 자동로그인 작업 안해도됨)
			MemberVO user = (MemberVO) modelAndView.getModel().get("user");
	        if (user != null) {
	            request.getSession().setAttribute("kuser", user);
	        }
	    }
	}
}