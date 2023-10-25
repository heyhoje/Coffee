package kr.kh.finalproject.dao;

import org.apache.ibatis.annotations.Param;

import kr.kh.finalproject.vo.MemberVO;

public interface MemberDAO {

	void insertUser(@Param("member")MemberVO member);
	
	boolean insertMember(@Param("member")MemberVO member);

	MemberVO selectMember(@Param("id")String id);



}
