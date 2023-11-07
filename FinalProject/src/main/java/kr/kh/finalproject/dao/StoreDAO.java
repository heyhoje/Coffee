package kr.kh.finalproject.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import kr.kh.finalproject.vo.StoreVO;

public interface StoreDAO {

	// 사이트 관리자 페이지
	List<StoreVO> selectBsList(@Param("st_approval")int st_approval);

	// 매장등록 승인&거절
	boolean updateStore(@Param("store")StoreVO store);
}
