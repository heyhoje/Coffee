package kr.kh.finalproject.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import kr.kh.finalproject.vo.ImageVO;
import kr.kh.finalproject.vo.ManagerVO;
import kr.kh.finalproject.vo.StoreVO;

public interface StoreDAO {

	// 사이트 관리자 페이지
	List<StoreVO> selectBsList(@Param("st_approval")int st_approval);

	// 매장등록 승인&거절
	boolean updateStore(@Param("store")StoreVO store);

	// 매장등록 추가정보 입력
	boolean insertPlusInfo(@Param("plus")StoreVO store);

	// 첨부파일 등록
	void insertImage(@Param("image")ImageVO imageVo);
	
	int getStore(@Param("buser")ManagerVO buser);
}
