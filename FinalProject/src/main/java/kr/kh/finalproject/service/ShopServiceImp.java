package kr.kh.finalproject.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.kh.finalproject.dao.ShopDAO;

@Service
public class ShopServiceImp implements ShopService{
	
	@Autowired
	ShopDAO shopDao;

	@Override
	public void searchShop(String searchName) {
		shopDao.searchShopName(searchName);
		
	}

}
