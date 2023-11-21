package kr.kh.finalproject.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.kh.finalproject.dao.ReviewDAO;
import kr.kh.finalproject.vo.MemberVO;
import kr.kh.finalproject.vo.OrderMenuVO;
import kr.kh.finalproject.vo.ReviewVO;

@Service
public class ReviewServiceImp implements ReviewService{

	@Autowired
	ReviewDAO reviewDao;
	
	/** 리뷰게시판 */
	@Override
	public List<ReviewVO> getRvList() {

		return reviewDao.selectRvList();
	}
	
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

	/** 주문메뉴 리스트 + 리뷰 등록 페이지 */
	@Override
	public List<OrderMenuVO> getOrderList(MemberVO user) {
		
		return reviewDao.selectOrderList(user);
	}

	@Override
	public boolean insertReview(ReviewVO review, MemberVO user) {
		if(review == null) {
			return false;
		}
		
		// int orderNum = review.getRe_or_num();
		
		// re_or_num 에 대한 리뷰가 이미 존재하는 경우
//		if(review != null || review.getRe_or_num() ) {
//			System.out.println("해당 주문번호에 대한 리뷰가 이미 존재합니다.");
//		}
		
		review.setRe_user_id(user.getMe_user_id());
		return reviewDao.insertReview(review, user);
	}

	
}
