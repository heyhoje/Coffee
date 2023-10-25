package kr.kh.finalproject.vo;

import lombok.Data;

@Data
public class UserVO {
	private String user_id; //사용자 아이디
	private String user_aorb; // 회원 여부
	private String user_phone; // 전화 번호
}
