package kr.kh.finalproject.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.kh.finalproject.dao.StoreDAO;
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
		if(store == null || store.getSt_num() <= 0) {
			return false;
		}
		return storeDao.updateStore(store);
	}
}
