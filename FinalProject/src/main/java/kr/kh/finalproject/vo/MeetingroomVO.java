package kr.kh.finalproject.vo;

import java.util.Date;

import lombok.Data;

@Data
public class MeetingroomVO {

	int room_num; 
	int room_st_num; 
	int room_price; 
	int room_seat; 
	String room_etc; 
	Date room_starttime; 
	Date room_endtime;
	String room_img;
	String room_content;
}
