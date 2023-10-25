package kr.kh.finalproject.vo;

import java.util.Date;

import lombok.Data;

@Data
public class MemberVO extends UserVO{
	private String me_user_id; 
	private String me_pw; 
	private String me_name; 
	private String me_email; 
	private String me_authority; 
	private String me_session_id; 
	private Date me_session_limit; 
	
	private boolean autoLogin;

	@Override
	public String toString() {
		return "MemberVO [me_user_id=" + me_user_id + ", me_pw=" + me_pw + ", me_name=" + me_name + ", me_email="
				+ me_email + ", me_authority=" + me_authority + ", me_session_id=" + me_session_id
				+ ", me_session_limit=" + me_session_limit + ", autoLogin=" + autoLogin + ", user_id=" + user_id
				+ ", user_aorb=" + user_aorb + ", user_phone=" + user_phone + "]";
	}
	
	
}
