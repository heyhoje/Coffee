package kr.kh.finalproject.dao;

import org.apache.ibatis.annotations.Param;

import kr.kh.finalproject.vo.InterestVO;
import kr.kh.finalproject.vo.KakaoVO;
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


	int checkUserExists(String kakaoId);

	MemberVO getMemberByKakaoId(String kakaoId);

	MemberVO memberIdSearch(MemberVO memberSearch);

	int memberPwdCheck(MemberVO member);

	void passwordUpdate(MemberVO member);


	
	public void pwUpdate(@Param("me_user_id") String me_user_id, @Param("me_pw1") String enpassword) throws Exception;

	String pwCheck(String me_pw) throws Exception;

	void deleteMember(String me_user_id) throws Exception;

	void deleteUser(String me_user_id) throws Exception;

	void infoUpdate(MemberVO member)throws Exception;

	void interestUpdate(InterestVO interest)throws Exception;



}
