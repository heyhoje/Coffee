package kr.kh.finalproject.service;

import kr.kh.finalproject.vo.MemberVO;

public interface MemberService {

	boolean signup(MemberVO member);
	
	boolean checkId(String id);

	MemberVO login(MemberVO member);

    void updateMemberSession(MemberVO user);

	MemberVO getMemberBySessionId(String value);

	//카카오

	void insertMemberKakao(MemberVO member);

	MemberVO selectMemberKakao(String kakaoUserId);

}
