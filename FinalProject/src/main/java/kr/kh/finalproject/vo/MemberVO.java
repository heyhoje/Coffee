package kr.kh.finalproject.vo;

import java.util.Date;

import lombok.Data;

@Data
public class MemberVO extends OrderInfoVO{
	private int me_oi_num; 
	private String me_pw; 
	private String me_name; 
	private String me_email; 
	private String me_authority; 
	private String me_session_id; 
	private Date me_session_limit; 
	
	private boolean autoLogin;
	
	
}
