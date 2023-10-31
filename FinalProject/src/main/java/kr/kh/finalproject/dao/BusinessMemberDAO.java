package kr.kh.finalproject.dao;

import kr.kh.finalproject.vo.BusinessMemberVO;

public interface BusinessMemberDAO {

	BusinessMemberVO selectMember(String bm_id);

	void updateMemberSession(BusinessMemberVO user2);

	BusinessMemberVO selectMemberBySessionId(String sbId);
}
