package kr.kh.finalproject.service;

import kr.kh.finalproject.vo.BusinessMemberVO;

public interface BusinessMemberService {

	boolean checkId(String bid);

	BusinessMemberVO login(BusinessMemberVO businessMember);

	void updateMemberSession(BusinessMemberVO user2);

	BusinessMemberVO getMemberBySessionId(String value);

}
