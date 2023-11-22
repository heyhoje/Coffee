package kr.kh.finalproject.service;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import kr.kh.finalproject.vo.ManagerVO;
import kr.kh.finalproject.vo.StoreVO;

public interface StoreService {

	// 사이트 관리자 페이지
	List<StoreVO> getBstoreList(int st_approval);
	
	// 매장등록 승인&거절
	boolean updateStore(StoreVO store);

	// 매장등록 추가정보 입력
	boolean plusInfo(StoreVO store, ManagerVO buser, MultipartFile[] files);

	int getStore(ManagerVO user);

}
