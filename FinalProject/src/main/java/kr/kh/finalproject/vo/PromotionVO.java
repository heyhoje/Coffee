package kr.kh.finalproject.vo;

import lombok.Data;

@Data
public class PromotionVO {
	
	

	// 프로모션 테이블 VO
	int pr_num; // 번호
	String pr_subject; // 프로모션 제목
	String pr_contents; // 프로모션 내용
	int pr_type; // 프로모션 타입
	int pr_discount; // 할인율
	int pr_save; // 적립률
	String pr_store; // 매장 (프로모션이 적용되는?)
	int pr_approval; // 프로모션 승인 상태

}
