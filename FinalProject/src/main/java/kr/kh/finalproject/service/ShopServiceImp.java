package kr.kh.finalproject.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.kh.finalproject.dao.ShopDAO;
import kr.kh.finalproject.pagination.Criteria;
import kr.kh.finalproject.vo.ManagerVO;

@Service
public class ShopServiceImp implements ShopService{
	
	@Autowired
	ShopDAO shopDao;

	@Override
	public void searchShop(String searchName) {
		shopDao.searchShopName(searchName);
		
	}

	@Override
	public List<ManagerVO> getShopList(Criteria cri) {
		if(cri == null) {
			cri = new Criteria();
		}
		return shopDao.selectShopList(cri);
	}

	@Override
	public List<ManagerVO> getShopList(Criteria cri, Double ipLati, Double ipLongi) {
		if(cri == null) {
			cri = new Criteria();
		}
		return shopDao.selectShopListKm(cri, ipLati, ipLongi);
	}
}

	
