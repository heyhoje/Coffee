package kr.kh.finalproject.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.kh.finalproject.dao.MeetingroomDAO;
import kr.kh.finalproject.pagination.Criteria;
import kr.kh.finalproject.vo.MeetingroomVO;
import kr.kh.finalproject.vo.ReservationVO;
import kr.kh.finalproject.vo.RoomBasketVO;

@Service
public class MeetingroomServiceImp implements MeetingroomService{

	@Autowired
	MeetingroomDAO meetingroomDao;
	
	
	@Override
	public List<MeetingroomVO> getMrList(Criteria cri) {
			if(cri == null) {
				cri = new Criteria();
				}
		return meetingroomDao.selectMrList(cri);
	}

	@Override
	public int getTotalCount(Criteria cri) {
		return meetingroomDao.selectMrTotalCount();
	}

	@Override
	public List<ReservationVO> getRsList(Criteria cri) {
			if(cri == null) {
				cri = new Criteria();
			}
		return meetingroomDao.selectRsList();
	}

	@Override
	public boolean insertRBasket(int room_num, String id, int startTime) {
		return meetingroomDao.insertRBasket(room_num, id, startTime);
	}

	@Override
	public List<RoomBasketVO> rBasketList(String id) {
		return meetingroomDao.rBasketList(id);
	}

	@Override
	public boolean insertRV(String id, String rs_start, String rs_room_num) {
		return meetingroomDao.insertRV(id, rs_start, rs_room_num);
	}

	@Override
	public boolean killBaguni(String id) {
		return meetingroomDao.killBaguni(id);
	}
	
	// 룸예약 정보를 장바구니에 담기
	/*
	 * @Override public boolean addToRoomBasket(RoomBasketVO roomBasket) {
	 * 
	 * return meetingroomDao.insertRoomBasket(roomBasket); }
	 */

}
