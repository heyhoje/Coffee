package kr.kh.finalproject.service;

import java.util.List;

import kr.kh.finalproject.pagination.Criteria;
import kr.kh.finalproject.vo.ShopVO;

public interface ShopService {

	void searchShop(String searchName);

	List<ShopVO> getShopList(Criteria cri);

	List<ShopVO> getShopList(Criteria cri, Double ipLati, Double ipLongi);

}
