package kr.kh.finalproject.dao;

import org.apache.ibatis.annotations.Param;

import kr.kh.finalproject.vo.MemberVO;

public interface MemberDAO {

	boolean insertMember(@Param("me_io_num")MemberVO member);
	
	boolean authenticateUser(@Param("username") String username, @Param("password") String password);

}
