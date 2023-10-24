package kr.kh.finalproject.vo;

import java.util.Date;
import lombok.Data;

@Data
public class BusinessMemberVO {
	private boolean autoLogin;
	private String bm_Id;
    private String bm_Pw;
    private String bm_Phone;
    private String bm_Contents;
    private String bm_Address;
    private String bm_Geocoding;
    private String bm_Manager;
    private int bm_Seat;
    private String bm_Parking;
    private String bm_Drive;
    private String bm_StoreName;
    private String bm_Num;
    private String bm_session_id;
    private Date bm_session_limit;
}
