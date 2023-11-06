package kr.kh.finalproject.service;

import java.util.List;

import kr.kh.finalproject.vo.ReviewVO;

public interface ReviewService {

	// 사이트 관리자 페이지
	List<ReviewVO> getReviewList();

}
