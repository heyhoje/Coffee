package kr.kh.finalproject.vo;

import java.util.Date;

import lombok.Data;

@Data
public class MemberVO{
	private boolean autoLogin;
	
	private String me_oi_id;
    private String me_pw;
    private String me_name;
    private String me_email;
    private int me_deposit;
    private int me_point;
    private String me_authority;
    private String me_session_id;
    private Date me_session_limit;
    private String me_ip;

    
}