package kr.kh.finalproject.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.kh.finalproject.dao.ReviewDAO;
import kr.kh.finalproject.vo.ReviewVO;

@Service
public class ReviewServiceImp implements ReviewService{

	@Autowired
	ReviewDAO reviewDao;
	
	/** 사이트 관리자*/
	@Override
	public List<ReviewVO> getReviewList() {

		return reviewDao.selectReList();
	}
	
	// 리뷰 삭제
	@Override
	public boolean deleteReview(ReviewVO review) {
		if(review == null) {
			return false;
		}
		return reviewDao.deleteReview(review);
	}
}
