package kr.kh.finalproject.service;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import kr.kh.finalproject.vo.ManagerVO;
import kr.kh.finalproject.vo.StoreVO;

public interface StoreService {

	// 사이트 관리자 페이지
	List<StoreVO> getBstoreList(int st_approval);
	
	// 매장등록 승인&거절 -> 필요없어짐
	// boolean updateStore(StoreVO store);

	/** 일단 회원가입과 동시에 st_num을 발급해주기 위한 메소드 추가 */
	StoreVO makeStore(ManagerVO manager);
	
	/** 매장등록 추가정보 입력 및 업데이트(수정/관리로 변경인거지) */
	boolean plusInfo(StoreVO store, ManagerVO buser, MultipartFile[] files);

	StoreVO getStore(String bm_num);

	

}
