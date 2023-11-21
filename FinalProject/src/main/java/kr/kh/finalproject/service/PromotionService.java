package kr.kh.finalproject.service;

import java.util.List;

import kr.kh.finalproject.vo.PromotionVO;

public interface PromotionService {


	// 사이트 관리자 페이지
	List<PromotionVO> getPromotionList(int pr_approval);

	// 프로모션 승인&거절
	boolean updatePromotion(PromotionVO promotion);



}
