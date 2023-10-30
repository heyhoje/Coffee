package kr.kh.finalproject.vo;

import lombok.Data;

@Data
public class UserVO {
	protected String user_id; //사용자 아이디
	protected String user_aorb; // 회원 여부
	protected String user_phone; // 전화 번호
	private boolean autoLogin;
}
