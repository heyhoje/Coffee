package kr.kh.finalproject.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import kr.kh.finalproject.pagination.Criteria;
import kr.kh.finalproject.vo.MeetingroomVO;
import kr.kh.finalproject.vo.ReservationVO;
import kr.kh.finalproject.vo.RoomBasketVO;

public interface MeetingroomDAO {

	// 미팅룸 리스트 & 예약자 리스트
	List<MeetingroomVO> selectMrList(@Param("cri")Criteria cri);

	int selectMrTotalCount();

	List<ReservationVO> selectRsList();

	boolean insertRBasket(@Param("room_num")int room_num, @Param("id")String id, @Param("startTime")int startTime);

	List<RoomBasketVO> rBasketList(@Param("id")String id);

	boolean insertRV(@Param("id")String id, @Param("rs_start")String rs_start, @Param("rs_room_num")String rs_room_num);

	boolean killBaguni(@Param("id")String id);
	
	// 룸예약 정보를 장바구니에 담기
	// boolean insertRoomBasket(@Param("roomBasket")RoomBasketVO roomBasket);

}
