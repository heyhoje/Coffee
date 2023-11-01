package kr.kh.finalproject.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import kr.kh.finalproject.pagination.Criteria;
import kr.kh.finalproject.vo.PromotionVO;

public interface PromotionDAO {

	List<PromotionVO> selectPromotionList(@Param("cri")Criteria cri);

	int selectPromotionTotalCount();

}
