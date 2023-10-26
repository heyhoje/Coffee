package kr.kh.finalproject.vo;

import java.util.Date;
import lombok.Data;

@Data
public class BusinessMemberVO {
	private boolean autoLogin;
	private String bm_id;
    private String bm_pw;
    private String bm_num;
    private String bm_phone;
    private String bm_contents;
    private String bm_address;
    private String bm_geocoding;
    private String bm_manager;
    private int bm_seat;
    private String bm_parking;
    private String bm_drive;
    private String bm_storeName;
    private String bm_session_id;
    private Date bm_session_limit;
}
