package kr.kh.finalproject.vo;

import lombok.Data;

@Data
public class ReviewVO {

	int re_num; // 리뷰번호
	String re_contents; // 리뷰내용
	int re_star; // 별점
	int re_or_num; // 주문메뉴번호(어떤의미인지 확인 필요)
	
	// 주문메뉴&주문리스트 JOIN해서 값 가져옴
	String re_user_id; // 주문리스트에 있는 ol_user_id 를 re_user_id로 vo에 저장
	
}
