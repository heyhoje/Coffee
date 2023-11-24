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

	// 주문메뉴 리스트 + 리뷰 등록 페이지, 
	// 또 아무것도 안념기고 select해주라하니까 계속 all갖다주는데 왜 전체만 주냐고 뭐라함...
	List<OrderMenuVO> getOrderList(MemberVO user);

	boolean insertReview(ReviewVO review, MemberVO user);

}
