package kr.kh.finalproject.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.kh.finalproject.dao.MeetingroomDAO;
import kr.kh.finalproject.dao.ReservationDAO;
import kr.kh.finalproject.pagination.Criteria;
import kr.kh.finalproject.vo.MeetingroomVO;
import kr.kh.finalproject.vo.ReservationVO;

@Service
public class MeetingroomServiceImp implements MeetingroomService{

	@Autowired
	MeetingroomDAO meetingroomDao;
	
	
	@Override
	public List<MeetingroomVO> getMeetingroomList(Criteria cri) {
			if(cri == null) {
				cri = new Criteria();
				}
		return meetingroomDao.selectMeetingroomList(cri);
	}

	@Override
	public int getTotalCount(Criteria cri) {
		return meetingroomDao.selectMeetingroomTotalCount();
	}

	@Override
	public List<ReservationVO> getReservationList(Criteria cri) {
			if(cri == null) {
				cri = new Criteria();
			}
		return meetingroomDao.selectReservationList();
	}



}
