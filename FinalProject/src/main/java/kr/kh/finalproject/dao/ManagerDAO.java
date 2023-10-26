package kr.kh.finalproject.dao;

import org.apache.ibatis.annotations.Param;

import kr.kh.finalproject.vo.ManagerVO;

public interface ManagerDAO {

	ManagerVO selectManager(@Param("bm_id") String bm_id);

	boolean insertManager(@Param("manager") ManagerVO manager);

}
