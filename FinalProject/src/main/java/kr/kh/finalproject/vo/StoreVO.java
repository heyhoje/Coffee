package kr.kh.finalproject.vo;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import lombok.Data;

@Data
public class StoreVO {


	int st_num; // 매장번호
	String st_br_name; // 브랜드명
	String st_bm_num; // 사업자아이디
	
	String st_open; // 매장오픈여부. 아마 안쓸듯.
	
	// @DateTimeFormat(pattern = 24시간 형식)으로 Setter를 만들어줘야함!  
	// => "09:30" 같은 문자열이 들어온다면, 어노테이션을 통해 해당 문자열을 'Date' 객체로 변환할 때 "HH:mm"형식을 따르도록 함.
	@DateTimeFormat(pattern = "HH:mm")
	Date st_opentime; // 영업시작시간
	@DateTimeFormat(pattern = "HH:mm")
	Date st_closetime; // 영업종료시간
	String st_contents; // 기타 영업과 관련된 정보 입력란
	
	// 매장등록 승인 상태
	int st_approval;
	// 매장명 - 사업자회원 테이블과 JOIN해서 가져옴
	String st_store_name; // 사업자회원에 있는 bm_store_name을 st_store_name으로 vo에 저장
	 
}
