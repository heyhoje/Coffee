package kr.kh.finalproject.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import kr.kh.finalproject.pagination.Criteria;
import kr.kh.finalproject.vo.MeetingroomVO;
import kr.kh.finalproject.vo.ReservationVO;
import kr.kh.finalproject.vo.RoomBasketVO;

public interface MeetingroomDAO {

	List<MeetingroomVO> selectMrList(@Param("cri")Criteria cri);

	int selectMrTotalCount();

	List<ReservationVO> selectRsList();

}
