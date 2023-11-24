package kr.kh.finalproject.vo;

import java.util.Date;
import java.util.List;

import lombok.Data;

@Data
public class MeetingroomVO {

	private int room_num; // 미팅룸에 해당하는 기본키값
	private int room_st_num; // 매장번호는 정보값이 없음. 경로url에나 들어갈까?
	private String room_store_name; // bm에서 매장명을 대체할 매장이름 값을 가져오기 위해 vo에 저장
	
	// 검색했을 때 나와야하는 리스트 필터값
	private Date re_date; 
	private String room_content; // 미팅룸 이름을 적고 싶은건가?? 미팅룸A, 미팅룸B, ... 
	private int room_price; 
	private int room_seat; 
	private String room_etc; // 특이사항, 설명
	
	// 예약가는한 시간을 영업시간내 1시간 단위로 뿌려줌
	private int room_starttime; 
	private int room_endtime;
	private String room_img;
	
	// 시간대를 2개이상 선택하면 배열로 받아줘야함
	private int[] arr_room_starttime; 

	// 이건 checkbox disabled 때문에 필요해서 resultMap하고 리스트 추가해둔건가? (MenuVO - ImageVO 연결했을떄처럼?)
	// 그냥 ReservationVO reservation; 를 가져오는거랑 뭐가다른지 모르겠어서 일단 추가해봄
	private List<ReservationVO> reservationList;
	ReservationVO reservation;
}
