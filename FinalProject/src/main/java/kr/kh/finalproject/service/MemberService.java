package kr.kh.finalproject.service;

import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;

import kr.kh.finalproject.vo.KakaoVO;
import kr.kh.finalproject.vo.MemberVO;
import kr.kh.finalproject.vo.UserVO;

public interface MemberService {

	boolean signup(MemberVO member);
	
	boolean checkId(String id);

	MemberVO login(MemberVO member);

	// 일반회원 - 세션 저장 / 자동 로그인
    void updateMemberSession(MemberVO user);

	MemberVO getMemberBySessionId(String value);

	// 카카오

	void insertMemberKakao(MemberVO member);

	MemberVO selectMemberKakao(String kakaoUserId);

	void insertUserKakaoInfo(UserVO user);

	UserVO selectUserKakaoInfo(String userId);


	boolean checkUserExists(String kakaoId);

	MemberVO getMemberByKakaoId(String kakaoId);


	MemberVO memberIdSearch(MemberVO memberSearch);
	
	int memberPwdCheck(MemberVO member);
	
	void passwordUpdate(MemberVO member);

	String pwCheck(String me_user_id) throws Exception;

	void pwUpdate(String me_user_id, String hashedPw) throws Exception;

}
