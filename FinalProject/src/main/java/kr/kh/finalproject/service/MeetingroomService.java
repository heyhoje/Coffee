package kr.kh.finalproject.service;

import java.util.List;

import kr.kh.finalproject.pagination.Criteria;
import kr.kh.finalproject.vo.MeetingroomVO;
import kr.kh.finalproject.vo.ReservationVO;
import kr.kh.finalproject.vo.RoomBasketVO;

public interface MeetingroomService {
	
	// 미팅룸 리스트
	List<MeetingroomVO> getMrList(Criteria cri);
	
	int getTotalCount(Criteria cri);

	// 예약자 리스트 - 를 왜 같이 작업해야하지? 선택된 시간을 disabled 처리해서?
	List<ReservationVO> getRsList(Criteria cri);
	
	// 룸예약 정보를 장바구니로 넘겨주는 작업
	// boolean addToRoomBasket(RoomBasketVO roomBasket);

}
