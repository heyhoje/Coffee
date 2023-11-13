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
	
	// 매장명 - 사업자회원 테이블과 JOIN해서 가져옴
	String st_store_name; // 사업자회원에 있는 bm_store_name을 st_store_name으로 vo에 저장
	int st_approval; // 매장등록 승인상태
}
