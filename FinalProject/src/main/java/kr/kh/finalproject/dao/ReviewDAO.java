package kr.kh.finalproject.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import kr.kh.finalproject.vo.MemberVO;
import kr.kh.finalproject.vo.OrderMenuVO;
import kr.kh.finalproject.vo.ReviewVO;

public interface ReviewDAO {
	
	// 리뷰게시판
	List<ReviewVO> selectRvList(); // 리뷰부터 메뉴까지 쪼인
	
	// 사이트 관리자
	List<ReviewVO> selectReList(); // 리뷰부터 주문리스트까지 쪼인

	// 리뷰 삭제
	boolean deleteReview(@Param("review")ReviewVO review);

	// 주문메뉴 리스트 + 리뷰 등록
	// 뒤에 #{user.me_user_id} 로 입력값 불러오면서 @Param 붙이는거 까먹음. 혼자 순서대로 했으면 안까먹었을텐데....
	List<OrderMenuVO> selectOrderList(@Param("user")MemberVO user);

	boolean insertReview(@Param("review")ReviewVO review, @Param("user")MemberVO member);


}
