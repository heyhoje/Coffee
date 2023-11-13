package kr.kh.finalproject.service;

import java.util.List;

import kr.kh.finalproject.pagination.Criteria;
import kr.kh.finalproject.vo.MeetingroomVO;
import kr.kh.finalproject.vo.ReservationVO;

public interface MeetingroomService {

	List<MeetingroomVO> getMeetingroomList(Criteria cri);
	
	int getTotalCount(Criteria cri);

	List<ReservationVO> getReservationList(Criteria cri);



	


}
