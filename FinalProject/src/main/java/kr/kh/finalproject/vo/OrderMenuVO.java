package kr.kh.finalproject.vo;

import java.util.Date;

import lombok.Data;

@Data
public class OrderMenuVO {
	private int or_num;
	private Date or_time;
	private String or_state;
	private String or_drinks;

	private String or_manuNum; // 주문된 메뉴들 번호을 모아놓은것. ex)아메, 아메, 아메 = 4, 4, 4
}
