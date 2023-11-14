package kr.kh.finalproject.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import kr.kh.finalproject.pagination.Criteria;
import kr.kh.finalproject.vo.AdvertisementVO;

public interface AdvertisementDAO {

	List<AdvertisementVO> selectAdvertisementList(@Param("cri")Criteria cri);

	int selectAdvertisementTotalCount();

}
