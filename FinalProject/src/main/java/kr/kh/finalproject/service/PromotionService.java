package kr.kh.finalproject.service;

import java.util.List;

import kr.kh.finalproject.pagination.Criteria;
import kr.kh.finalproject.vo.PromotionVO;
import kr.kh.finalproject.vo.Promotion2VO;

public interface PromotionService {

	List<PromotionVO> getPromotionList(Criteria cri);

	int getTotalCount();

	// 사이트 관리자 페이지
	List<PromotionVO> getPromotionList(int pr_approval);



}
