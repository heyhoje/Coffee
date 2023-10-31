package kr.kh.finalproject.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import kr.kh.finalproject.pagination.Criteria;
import kr.kh.finalproject.vo.ShopVO;

public interface ShopDAO {

	void searchShopName(@Param("name")String searchName);

	List<ShopVO> selectShopList(@Param("cri")Criteria cri);

	List<ShopVO> selectShopListKm(@Param("cri")Criteria cri, @Param("ipLati")Double ipLati, @Param("ipLongi")Double ipLongi);


}
