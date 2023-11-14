package kr.kh.finalproject.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.kh.finalproject.dao.AdvertisementDAO;
import kr.kh.finalproject.pagination.Criteria;
import kr.kh.finalproject.vo.AdvertisementVO;

@Service
public class AdvertisementServiceImp implements AdvertisementService {
	
	@Autowired
	AdvertisementDAO advertisementDao;

	@Override
	public List<AdvertisementVO> getAdvertisementList(Criteria cri) {
		if(cri == null) {
			cri = new Criteria(); 
		}
		return advertisementDao.selectAdvertisementList(cri);
	}

	@Override
	public int getTotalCount(Criteria cri) {
		return advertisementDao.selectAdvertisementTotalCount();
	}



}
