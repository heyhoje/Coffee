package kr.kh.finalproject.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import kr.kh.finalproject.vo.OrderMenuVO;
import kr.kh.finalproject.vo.ReviewVO;

public interface ReviewDAO {
	
	// 리뷰게시판
	List<ReviewVO> selectRvList(); // 리뷰부터 메뉴까지 쪼인
	
	// 사이트 관리자
	List<ReviewVO> selectReList(); // 리뷰부터 주문리스트까지 쪼인

	// 리뷰 삭제
	boolean deleteReview(@Param("review")ReviewVO review);

	// 리뷰 등록
	List<OrderMenuVO> selectOrderList();

	boolean insertReview(@Param("review")ReviewVO review);


}
