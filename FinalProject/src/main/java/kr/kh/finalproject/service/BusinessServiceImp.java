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
	public boolean updateMenu(String mn_num, String mn_name, String mn_price, String mn_contents) {
		return businessDao.updateMenu(mn_num, mn_name, mn_price, mn_contents);
	}

	@Override
	public boolean uInsertOption(String ov_os_num) {
		return businessDao.uInsertOption(ov_os_num);
	}

	@Override
	public int getOptionNum(String mn_num) {
		return businessDao.getOptionNum(mn_num);
	}

	@Override
	public boolean uInsertOptionMoongchi(String mn_num, int maxOptionNum) {
		return businessDao.uInsertOptionMoongchi(mn_num, maxOptionNum);
	}

	@Override
	public int getNewOs_Num() {
		return businessDao.getNewOs_Num();
	}

	@Override
	public boolean uInsertOptionMoongchi2(int newOs_Num) {
		return businessDao.uInsertOptionMoongchi2(newOs_Num);
	}

	@Override
	public boolean deleteOptionMoongchi(String mn_num, String os_optionNum) {
		return businessDao.deleteOptionMoongchi(mn_num, os_optionNum);
	}

	@Override
	public int getOs_Num(String mn_num, String os_optionNum) {
		return businessDao.getOs_Num(mn_num, os_optionNum);
	}

	@Override
	public boolean deleteOptionMoongchi2(int getOs_Num) {
		return businessDao.deleteOptionMoongchi2(getOs_Num);
	}

	@Override
	public boolean deleteOptionValue(String ov_num) {
		return businessDao.deleteOptionValue(ov_num);
	}

	@Override
	public boolean updateOption(String os_num, String os_name, String mn_num) {
		return businessDao.updateOption(os_num, os_name, mn_num);
	}

	@Override
	public boolean updateOptionValue(String ov_num, String ov_value, String ov_price) {
		
		return businessDao.updateOptionValue(ov_num, ov_value, ov_price);
	}

	@Override
	public boolean makeMenuMijung(String st_num) {
		return businessDao.makeMenuMijung(st_num);
	}

	@Override
	public int getMijungMn_num() {
		return businessDao.getMijungMn_num();
	}

	@Override
	public boolean makeOptionMijung(int mn_num) {
		return businessDao.makeOptionMijung(mn_num);
	}

	@Override
	public boolean makeOptionValueMijung(int os_num) {
		return businessDao.makeOptionValueMijung(os_num);
	}

	@Override
	public int getMn_num() {
		return businessDao.getMn_num();
	}



}
