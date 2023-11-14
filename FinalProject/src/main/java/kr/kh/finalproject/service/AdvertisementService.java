package kr.kh.finalproject.service;

import java.util.List;

import kr.kh.finalproject.pagination.Criteria;
import kr.kh.finalproject.vo.AdvertisementVO;

public interface AdvertisementService {
	
	List<AdvertisementVO> getAdvertisementList(Criteria cri);
	
	int getTotalCount(Criteria cri);

	// 사이트 관리자 사이트
	List<AdvertisementVO> getAdList(int ad_approval);

	// 광고 승인&거절 기능
	boolean updateAd(AdvertisementVO ad);

}
