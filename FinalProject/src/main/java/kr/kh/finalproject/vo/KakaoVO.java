package kr.kh.finalproject.vo;

import lombok.Data;

@Data
public class KakaoVO{
	
	private String kakao_user_id;
    private String kakao_email; 
    private String kakao_name; 

	private boolean autoLogin;

}
