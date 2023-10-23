package kr.kh.finalproject.vo;

import lombok.Data;

@Data
public class OrderInfoVO extends MemberVO{
	private String oi_id; //사용자 아이디
	private String oi_aorb; // 회원 여부
	private String oi_phone; // 전화 번호
}
