package kr.kh.finalproject.vo;

import lombok.Data;

@Data
public class BusinessVO {

	/* 사업자  */
	private String bm_id; //아이디
	private String bm_pw; //비밀번호
	private String bm_num; //사업자 번호
	private String bm_phone; //매장 전화번호
	private String bm_contents; // 매장정보
	private String bm_address; // 매장 주소
	private String bm_geocoding; // 매장 주소변환(위도,경도)
	private String bm_manager; //담당자
	private int bm_seat; // 매장 내 좌석
	private String bm_parking; // 주차 가능 여부;
	private String bm_drive; // 드라이브 쓰루 여부;
	private String bm_store_name; //매장명
}
