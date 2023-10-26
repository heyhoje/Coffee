package kr.kh.finalproject.service;

import java.util.List;

import kr.kh.finalproject.pagination.Criteria;
import kr.kh.finalproject.vo.PromotionVO;

public interface PromotionService {

	List<PromotionVO> getPromotionList(Criteria cri);

	int getTotalCount(Criteria cri);

}
