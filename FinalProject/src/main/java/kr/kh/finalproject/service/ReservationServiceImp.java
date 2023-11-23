package kr.kh.finalproject.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.kh.finalproject.dao.ReservationDAO;
import kr.kh.finalproject.vo.ReservationVO;

@Service
public class ReservationServiceImp implements ReservationService{

	@Autowired
    private ReservationDAO reservationDao;


	@Override
	public void save(ReservationVO reservation) {
		reservationDao.save(reservation);
	}

}
