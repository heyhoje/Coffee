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
	boolean makeStore(ManagerVO manager); // insert, delete, update는 검색(select)가 아니기 때문에 
										  //int 또는 true/flase값만 보내준다. StoreVO로 시작해서 무한증식이 시작되었다. 
	
	/** 매장등록 추가정보 입력 및 업데이트(수정/관리로 변경인거지) */
	boolean plusInfo(StoreVO store, ManagerVO buser, MultipartFile[] files);

	int getStore(ManagerVO user);

	int getApprovalByBmId(String bm_id);

	

}
