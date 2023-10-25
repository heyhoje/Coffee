package kr.kh.finalproject.service;

import kr.kh.finalproject.vo.MemberVO;

public interface MemberService {

	boolean signup(MemberVO member);

	boolean checkId(String id);

}
