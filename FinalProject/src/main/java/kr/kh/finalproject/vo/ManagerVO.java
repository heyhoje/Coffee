package kr.kh.finalproject.vo;

import java.util.Date;

import lombok.Data;

@Data
public class ManagerVO {

   /* 사업자  */
   private String bm_id; //아이디
   private String bm_pw; //비밀번호
   private String bm_num; //사업자 번호
   private String bm_phone; //매장 전화번호
   
   private String bm_manager; //담당자
   private String bm_store_name; //매장명
   
   private String bm_post; //우편번호
   private String bm_address; // 매장 주소
   private String bm_address2;// 매장 상세주소
   private Double bm_geocoding_lati;
   private Double bm_geocoding_longi;
   private String bm_image;
   // bm_contents에 쓰도록 유도
   private int bm_seat; // 매장 내 좌석
   private String bm_parking; // 주차 가능 여부;
   private String bm_drive; // 드라이브 쓰루 여부;
   
   
   // 자동로그인
   private boolean autoLogin;
   private String bm_session_id;
   private Date bm_session_limit;
   
   // 회원 승인 상태
   private int bm_approval;
   private int st_num;
   private String st_contents;

}