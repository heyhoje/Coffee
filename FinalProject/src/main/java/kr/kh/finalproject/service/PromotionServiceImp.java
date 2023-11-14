package kr.kh.finalproject.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.kh.finalproject.dao.PromotionDAO;
import kr.kh.finalproject.pagination.Criteria;
import kr.kh.finalproject.vo.PromotionVO;

@Service
public class PromotionServiceImp implements PromotionService{
	
	@Autowired
	PromotionDAO promotionDao;

	
	/** 사이트 관리자 페이지 */
	@Override
	public List<PromotionVO> getPromotionList(int pr_approval) {
		
		return promotionDao.selectPrList(pr_approval);
	}

	/** 프로모션 승인&거절 */
	@Override
	public boolean updatePromotion(PromotionVO promotion) {
		if(promotion == null || promotion.getPr_num() <= 0) {
			return false;
		}
		return promotionDao.updatePromotion(promotion);
	}
}
