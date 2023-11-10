package kr.kh.finalproject.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import kr.kh.finalproject.vo.ReviewVO;

public interface ReviewDAO {
	
	// 사이트 관리자
	List<ReviewVO> selectReList();

	// 리뷰 삭제
	boolean deleteReview(@Param("review")ReviewVO review);

}
