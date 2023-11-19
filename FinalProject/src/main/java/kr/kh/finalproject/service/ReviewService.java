package kr.kh.finalproject.service;

import java.util.List;

import kr.kh.finalproject.vo.MemberVO;
import kr.kh.finalproject.vo.OrderMenuVO;
import kr.kh.finalproject.vo.ReviewVO;

public interface ReviewService {

	// 리뷰게시판
	List<ReviewVO> getRvList();

	// 사이트 관리자 페이지
	List<ReviewVO> getReviewList();
	
	// 리뷰 삭제
	boolean deleteReview(ReviewVO review);

	// 리뷰 등록 페이지
	List<OrderMenuVO> getOrderList();

	boolean insertReview(ReviewVO review, OrderMenuVO order);

}
