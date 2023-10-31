package kr.kh.finalproject.dao;

import java.util.List;

import kr.kh.finalproject.pagination.Criteria;
import kr.kh.finalproject.vo.PromotionVO;

public interface PromotionDAO {

	List<PromotionVO> selectPromotionList(Criteria cri);

}
