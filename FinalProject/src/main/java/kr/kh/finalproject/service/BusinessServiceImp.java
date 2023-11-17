package kr.kh.finalproject.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.kh.finalproject.dao.BusinessDAO;

@Service
public class BusinessServiceImp implements BusinessService {
	
	@Autowired
	private BusinessDAO businessDao;

	@Override
	public boolean deleteMenu(String menu_num) {
		return businessDao.deleteMenu(menu_num);
	}

	@Override
	public boolean deleteOption(String menu_num) {
		return businessDao.deleteOption(menu_num);
	}

	@Override
	public int getSt_num(int mn_num) {
		return businessDao.getSt_num(mn_num);
	}

	@Override
	public boolean updateMenu(int mn_num, String mn_name, int mn_price, String mn_contents) {
		return businessDao.updateMenu(mn_num, mn_name, mn_price, mn_contents);
	}

}
