package kr.kh.finalproject.vo;

import lombok.Data;

@Data
public class PromotionVO {
	
	int pr_num;
	String pr_subject;
	String pr_contents;
	int pr_types;
	int pr_discount;
	int pr_save;
}
