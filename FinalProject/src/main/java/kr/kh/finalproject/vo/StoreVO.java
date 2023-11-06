package kr.kh.finalproject.vo;

import java.util.Date;

import lombok.Data;

@Data
public class StoreVO {

	int st_num; // 매장번호
	String st_br_name; // 브랜드명
	String st_bm_id; // 사업자아이디
	
	String st_open; // 매장오픈여부
	Date st_opentime; // 영업시작시간
	Date st_closetime; // 영업종료시간
	
	int st_approval; // 매장등록 승인상태
}
