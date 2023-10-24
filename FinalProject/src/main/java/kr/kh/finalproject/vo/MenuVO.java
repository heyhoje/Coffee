package kr.kh.finalproject.vo;

import lombok.Data;

@Data
public class MenuVO {
	
	int mn_num;
	String mn_name;
	String mn_contents;
	int mn_price;
	
	int mn_st_num; // 매장 고유번호
	int mn_mc_num; // 메뉴 중분류번호
	
}
