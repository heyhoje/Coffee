package kr.kh.finalproject.service;

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

	String pwCheck(String me_user_id);

	void pwUpdate(String me_user_id, String hashedPw);


}
