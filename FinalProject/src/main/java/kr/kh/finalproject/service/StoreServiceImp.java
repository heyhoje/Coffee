package kr.kh.finalproject.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.kh.finalproject.dao.StoreDAO;
import kr.kh.finalproject.vo.ManagerVO;
import kr.kh.finalproject.vo.StoreVO;

@Service
public class StoreServiceImp implements StoreService{

	@Autowired
	StoreDAO storeDao;

	/** 사이트 관리자 페이지 */
	@Override
	public List<StoreVO> getBstoreList(int st_approval) {

		return storeDao.selectBsList(st_approval);
	}

	/** 매장등록 승인&거절 */
	@Override
	public boolean updateStore(StoreVO store) {
		if(store == null) {
			return false;
		}
		return storeDao.updateStore(store);
	}

	/** 매장등록 추가정보 입력 */
	@Override
	public boolean plusInfo(StoreVO store, ManagerVO buser) {
		if(store == null || buser == null || buser.getBm_id() == null ) {
			return false;
		}

		store.setSt_bm_id(buser.getBm_id()); // bm_id값은 set으로 st_bm_id에 값 넣으면, buser 안넘겨도됨..ㅜㅠㅠ
		return storeDao.insertPlusInfo(store);
	}

	@Override
	public StoreVO getStore(String bm_num) {
		if(bm_num == null) {
		return null;
		}
		return storeDao.selectStore(bm_num);
	}
}
