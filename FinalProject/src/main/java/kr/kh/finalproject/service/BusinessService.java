package kr.kh.finalproject.service;

public interface BusinessService {

	boolean deleteMenu(String menu_num);

	boolean deleteOption(String menu_num);

	int getSt_num(int mn_num);

	boolean updateMenu(int mn_num, String mn_name, int mn_price, String mn_contents);



}
