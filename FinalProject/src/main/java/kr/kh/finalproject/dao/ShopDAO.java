package kr.kh.finalproject.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import kr.kh.finalproject.pagination.Criteria;
import kr.kh.finalproject.vo.ManagerVO;
import kr.kh.finalproject.vo.MemberVO;

public interface ShopDAO {

	void searchShopName(@Param("name")String searchName);

	List<ManagerVO> selectShopList(@Param("cri")Criteria cri);

	List<ManagerVO> selectShopListKm(@Param("cri")Criteria cri, @Param("ipLati")Double ipLati, @Param("ipLongi")Double ipLongi);


}
