package kr.kh.finalproject.dao;

import org.apache.ibatis.annotations.Param;

import kr.kh.finalproject.vo.MemberVO;
import kr.kh.finalproject.vo.UserVO;

public interface MemberDAO {

	void insertUser(@Param("member")MemberVO member);

	boolean insertMember(@Param("member")MemberVO member);

	MemberVO selectMember(@Param("id")String id);

	// 자동 로그인
	void updateMemberSession(@Param("member")MemberVO user);
	
	MemberVO selectMemberBySessionId(@Param("session_id")String sId);

	// 카카오
	void insertMemberKakao(MemberVO member); // 카카오 로그인 정보 삽입 메서드
    MemberVO selectMemberKakao(String kakaoUserId); // 카카오 로그인 정보 가져오는 메서드

	void insertUserKakaoInfo(UserVO user);
	UserVO selectUserKakaoInfo(String userId);

	static void pwCheck(@Param("me_user_id")String me_user_id) {
	}

	static void pwUpdate(@Param("me_user_id")String me_user_id, String hashedPw) {
	}



}
