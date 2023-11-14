package kr.kh.finalproject.vo;

import java.util.Date;

import lombok.Data;

@Data
public class OrderMenuVO {
	private int or_num;
	private Date or_time;
	private String or_state;
	private String or_drinks;
}
