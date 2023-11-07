package kr.kh.finalproject.service;

import java.util.List;

import kr.kh.finalproject.pagination.Criteria;
import kr.kh.finalproject.vo.ManagerVO;

public interface ManagerService {

	boolean managerRegister(ManagerVO manager);

	boolean manageridCheck(String id);

	ManagerVO login(ManagerVO manager);

	void updateMemberSession(Object user2);

	ManagerVO getMemberBySessionId(String value);

	// 사이트 관리자 페이지
	List<ManagerVO> getBMemberList(int bm_approval);

	int getTotalCount(ManagerVO manager, Criteria cri);
	
	// 승인&거절
	boolean updateManager(ManagerVO manager);



}
