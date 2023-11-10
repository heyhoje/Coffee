package kr.kh.finalproject.vo;

import java.util.List;

import lombok.Data;

@Data
public class MeetingroomVO {

	int room_num; 
	int room_st_num; 
	int room_price; 
	int room_seat; 
	String room_etc; 
	int room_starttime; 
	int room_endtime;
	String room_img;
	String room_content;
	
	private List<ReservationVO> reservationList;
}
