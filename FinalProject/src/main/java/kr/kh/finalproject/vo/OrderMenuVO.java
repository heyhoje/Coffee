package kr.kh.finalproject.vo;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import lombok.Data;

@Data
public class OrderMenuVO {
	private int or_num;
	//@DateTimeFormat(pattern = "yy-MM-dd HH:mm")
	private Date or_time;
	private String or_state;
	private String or_drinks;

	private String or_manuNum; // 주문된 메뉴들 번호을 모아놓은것. ex)아메, 아메, 아메 = 4, 4, 4
	private String or_store_name; // bm - 매장이름
	private String or_mn_name; // menu - 메뉴이름
	private String or_user_id; // ol - 사용자 아이디
}
