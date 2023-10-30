package kr.kh.finalproject.service;

import kr.kh.finalproject.vo.ManagerVO;

public interface ManagerService {

	boolean managerRegister(ManagerVO manager);

	boolean manageridCheck(String id);

	ManagerVO login(ManagerVO manager);

	void updateMemberSession(Object user2);

	ManagerVO getMemberBySessionId(String value);



}
