package kr.kh.finalproject.vo;

import java.util.Date;

import lombok.Data;

@Data
public class MemberVO extends OrderInfoVO{
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

    // Getter and Setter methods for each field

    public String getMe_oi_id() {
        return me_oi_id;
    }

    public void setMe_oi_id(String me_oi_id) {
        this.me_oi_id = me_oi_id;
    }

    public String getMe_pw() {
        return me_pw;
    }

    public void setMe_pw(String me_pw) {
        this.me_pw = me_pw;
    }

    public String getMe_name() {
        return me_name;
    }

    public void setMe_name(String me_name) {
        this.me_name = me_name;
    }

    public String getMe_email() {
        return me_email;
    }

    public void setMe_email(String me_email) {
        this.me_email = me_email;
    }

    public int getMe_deposit() {
        return me_deposit;
    }

    public void setMe_deposit(int me_deposit) {
        this.me_deposit = me_deposit;
    }

    public int getMe_point() {
        return me_point;
    }

    public void setMe_point(int me_point) {
        this.me_point = me_point;
    }

    public String getMe_authority() {
        return me_authority;
    }

    public void setMe_authority(String me_authority) {
        this.me_authority = me_authority;
    }

    public String getMe_session_id() {
        return me_session_id;
    }

    public void setMe_session_id(String me_session_id) {
        this.me_session_id = me_session_id;
    }

    public Date getMe_session_limit() {
        return me_session_limit;
    }

    public void setMe_session_limit(Date me_session_limit) {
        this.me_session_limit = me_session_limit;
    }

    public String getMe_ip() {
        return me_ip;
    }

    public void setMe_ip(String me_ip) {
        this.me_ip = me_ip;
    }
}