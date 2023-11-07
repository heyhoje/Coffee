package kr.kh.finalproject.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import kr.kh.finalproject.vo.ManagerVO;

public interface ManagerDAO {

	ManagerVO selectManager(@Param("bm_id") String bm_id);

	boolean insertManager(@Param("manager") ManagerVO manager);

	void updateMemberSession(Object user2);

	ManagerVO selectMemberBySessionId(String bId);

	// 사이트 관리자 페이지
	List<ManagerVO> selectBMemberList(@Param("bm_approval")int bm_approval);

	// 승인&거절
	boolean updateManager(@Param("manager")ManagerVO manager);

//	int selectCountManagerList(@Param("manager") ManagerVO manager, @Param("cri")Criteria cri);



}
