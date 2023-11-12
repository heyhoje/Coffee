package kr.kh.finalproject.service;

import java.util.List;

import kr.kh.finalproject.vo.StoreVO;

public interface StoreService {

	// 사이트 관리자 페이지
	List<StoreVO> getBstoreList(int st_approval);
	
	// 매장등록 승인&거절
	boolean updateStore(StoreVO store);

}
