package kr.kh.finalproject.vo;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import lombok.Data;

@Data
public class ReservationVO {

	private int rs_num; 
	private int rs_start; 
	private int rs_room_num; 
	private String rs_user_id;
}
