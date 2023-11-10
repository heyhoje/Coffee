package kr.kh.finalproject.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import kr.kh.finalproject.pagination.Criteria;
import kr.kh.finalproject.vo.MeetingroomVO;

public interface MeetingroomDAO {

	List<MeetingroomVO> selectMeetingroomList(@Param("cri")Criteria cri);

	int selectMeetingroomTotalCount();

	String selectMeetingroomstart(@Param("room_num")String room_num);

}
