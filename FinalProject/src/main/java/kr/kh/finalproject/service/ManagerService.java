package kr.kh.finalproject.service;

import java.util.List;

import kr.kh.finalproject.pagination.Criteria;
import kr.kh.finalproject.vo.ManagerVO;

public interface ManagerService {

	boolean managerRegister(ManagerVO manager);

	boolean manageridCheck(String id);

	ManagerVO login(ManagerVO manager);

	// 사업자회원 - 자동 로그인 
	void updateBMemberSession(ManagerVO buser);

	ManagerVO getBMemberBySessionId(String value);

	// 사이트 관리자 페이지
	List<ManagerVO> getBMemberList(int bm_approval);

	int getTotalCount(ManagerVO manager, Criteria cri);
	
	// 승인&거절
	boolean updateManager(ManagerVO manager);

	ManagerVO managerIdSearch(ManagerVO manager);

	String pwCheck(String bm_pw)throws Exception;

	void pwUpdate(String bm_id, String enpassword)throws Exception;

	int managerPwdCheck(ManagerVO manager)throws Exception;

	void passwordUpdate(ManagerVO manager)throws Exception;

	void deleteManager(String bm_id)throws Exception;

	void infoUpdate(ManagerVO manager)throws Exception;

	String getSesstionSt_num(ManagerVO buser);




}
