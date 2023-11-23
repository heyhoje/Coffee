package kr.kh.finalproject.vo;

import java.util.Date;

import lombok.Data;

@Data
public class ReservationVO {

	private int rs_num; // 예약번호
	private int rs_rbNum; // 예약 장바구니번호
	
	private String rs_user_id; // 회원아이디
	private String rs_room_num; // 미팅룸번호
	private String rs_date; // 예약 날짜
	private String rs_start; // 예약 시작시간
	private String rs_people; //예약 인원수
	
}
