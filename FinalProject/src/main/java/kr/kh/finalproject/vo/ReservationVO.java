package kr.kh.finalproject.vo;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import lombok.Data;

@Data
public class ReservationVO {

	private int rs_num; 
	@DateTimeFormat(pattern = "yyyy-mm-dd hh-mm-ss")
	private Date rs_start; 
	private Date rs_end;
	private int rs_room_num; 
	private String rs_user_id;
}
