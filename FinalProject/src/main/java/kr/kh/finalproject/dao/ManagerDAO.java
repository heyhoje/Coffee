package kr.kh.finalproject.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import kr.kh.finalproject.vo.ManagerVO;

public interface ManagerDAO {

	ManagerVO selectManager(@Param("bm_id") String bm_id);

	boolean insertManager(@Param("manager") ManagerVO manager);

	// 사업자회원 - 자동로그인 

	void updateBMemberSession(@Param("manager")ManagerVO buser); // ManagerVO아니고 Object맞는건가????? 


	ManagerVO selectBMemberBySessionId(@Param("bm_session_id")String bId);

	// 사이트 관리자 페이지
	List<ManagerVO> selectBMemberList(@Param("bm_approval")int bm_approval);

	// 승인&거절
	boolean updateManager(@Param("manager")ManagerVO manager);

	//아이디찾기
	ManagerVO managerIdSearch(ManagerVO manager);

	//비밀번호찾기
	int managerPwdCheck(ManagerVO manager);
	
	void passwordUpdate(ManagerVO manager);
	
	//비밀번호변경
	String pwCheck(String bm_pw)throws Exception;

	void pwUpdate(@Param("bm_id")String bm_id, @Param("bm_pw1")String enpassword)throws Exception;

	void deleteManager(String bm_id)throws Exception;

	void infoUpdate(ManagerVO manager)throws Exception;

	String getSesstionSt_num(@Param("manager")ManagerVO buser);

//	int selectCountManagerList(@Param("manager") ManagerVO manager, @Param("cri")Criteria cri);



}
