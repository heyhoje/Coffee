package kr.kh.finalproject.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.kh.finalproject.dao.PromotionDAO;
import kr.kh.finalproject.pagination.Criteria;
import kr.kh.finalproject.vo.PromotionVO;
import kr.kh.finalproject.vo.Promotion2VO;

@Service
public class PromotionServiceImp implements PromotionService{
	
	@Autowired
	PromotionDAO promotionDao;

	@Override
	public List<PromotionVO> getPromotionList(Criteria cri) {
		if(cri == null) {
			cri = new Criteria(); 
		}
		return promotionDao.selectPromotionList(cri);
	}

	@Override
	public int getTotalCount() {
		return promotionDao.selectPromotionTotalCount();
	}

	// 사이트 관리자 페이지
	@Override
	public List<PromotionVO> getPromotionList(int pr_approval) {
		
		return promotionDao.selectPrList(pr_approval);
	}
}
