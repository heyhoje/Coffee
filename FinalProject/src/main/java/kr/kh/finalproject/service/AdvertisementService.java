package kr.kh.finalproject.service;

import java.util.List;

import kr.kh.finalproject.pagination.Criteria;
import kr.kh.finalproject.vo.AdvertisementVO;

public interface AdvertisementService {
	
	List<AdvertisementVO> getAdvertisementList(Criteria cri);
	
	int getTotalCount(Criteria cri);

}
