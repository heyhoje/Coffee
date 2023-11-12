package kr.kh.finalproject.vo;

import lombok.Data;

@Data
public class Option_ChoiceVO {
	private int oc_num;
	private int oc_mn_num;
	private int oc_ov_numl;
	private int oc_sb_num;
	private String oc_selected;
	private int oc_selected_price;
	
	private MenuVO menu;
	private Shop_BasketVO bagunii;
}
