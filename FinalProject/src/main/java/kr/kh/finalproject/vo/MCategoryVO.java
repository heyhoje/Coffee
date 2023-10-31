package kr.kh.finalproject.vo;

import lombok.Data;

@Data
public class MCategoryVO {

	int mc_num; // 중분류숫자
	int mc_lc_num; // 대분류숫자
	String mc_name; // 중분류이름
	int mc_st_num; // 매장고유숫자
	
}
