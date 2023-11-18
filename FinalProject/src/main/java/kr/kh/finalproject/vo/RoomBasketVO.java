package kr.kh.finalproject.vo;

import java.util.Date;

import lombok.Data;

@Data
public class RoomBasketVO {

	// 미팅룸과 예약 사이 페이지 = reservation + 장바구니번호 만 추가된 VO
	private int rs_rbNum; 
	
	private String rs_user_id; // 회원아이디
	private int rs_room_num; // 미팅룸번호
	private Date rs_date; // 예약 날짜
	private int rs_start; // 예약 시작시간
}
