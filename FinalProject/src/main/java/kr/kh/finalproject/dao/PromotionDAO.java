package kr.kh.finalproject.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import kr.kh.finalproject.pagination.Criteria;
import kr.kh.finalproject.vo.PromotionVO;
import kr.kh.finalproject.vo.Promotion2VO;

public interface PromotionDAO {

	List<PromotionVO> selectPromotionList(Criteria cri);

	int selectPromotionTotalCount();

	// 사이트 관리자 페이지
	List<PromotionVO> selectPrList(@Param("pr_approval")int pr_approval);

}
