package kr.kh.finalproject.service;

import java.util.List;

import kr.kh.finalproject.pagination.Criteria;
import kr.kh.finalproject.vo.ManagerVO;

public interface ShopService {

	void searchShop(String searchName);

	List<ManagerVO> getShopList(Criteria cri);

	List<ManagerVO> getShopList(Criteria cri, Double ipLati, Double ipLongi);

}
