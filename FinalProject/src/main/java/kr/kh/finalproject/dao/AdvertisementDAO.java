package kr.kh.finalproject.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import kr.kh.finalproject.pagination.Criteria;
import kr.kh.finalproject.vo.AdvertisementVO;

public interface AdvertisementDAO {

	List<AdvertisementVO> selectAdvertisementList(@Param("cri")Criteria cri);

	int selectAdvertisementTotalCount();

	// 사이트 관리자 페이지
	List<AdvertisementVO> selectAdList(@Param("ad_approval")int ad_approval);

	// 광고 승인&거절 기능
	boolean updateAd(@Param("ad")AdvertisementVO ad);

}
