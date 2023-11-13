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
	int re_ol_num; // 주문리스트에 있는 ol_num을 re_ol_num으로 vo에 저장. 주문리스트번호가 우리가 볼 수 있는 주문번호임. 
	
	// [ 리뷰 = 주문메뉴 - 주문리스트 - 장바구니 - 선택메뉴옵션 = 메뉴 ]
	String re_mn_name; // 메뉴에 있는 mn_name을 re_mn_name으로 vo에 저장. 주문한 메뉴 이름을 리뷰에 띄울 수 있도록!
	
}
