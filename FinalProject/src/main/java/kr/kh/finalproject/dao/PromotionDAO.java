package kr.kh.finalproject.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import kr.kh.finalproject.pagination.Criteria;
import kr.kh.finalproject.vo.PromotionVO;

public interface PromotionDAO {

	List<PromotionVO> selectPromotionList(@Param("cri")Criteria cri);

	int selectPromotionTotalCount();

	// 사이트 관리자 페이지
	List<PromotionVO> selectPrList(@Param("pr_approval")int pr_approval);

	// 프로모션 승인&거절
	boolean updatePromotion(@Param("promotion")PromotionVO promotion);

}
