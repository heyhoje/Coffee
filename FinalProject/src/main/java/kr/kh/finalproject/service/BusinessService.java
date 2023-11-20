package kr.kh.finalproject.service;


import org.springframework.stereotype.Service;


public interface BusinessService {

	boolean deleteMenu(String menu_num);

	boolean deleteOption(String menu_num);

	int getSt_num(int mn_num);

	boolean updateMenu(String mn_num, String mn_name, String mn_price, String mn_contents);

	boolean uInsertOption(String ov_os_num);

	int getOptionNum(String mn_num);

	boolean uInsertOptionMoongchi(String mn_num, int maxOptionNum);

	int getNewOs_Num();

	boolean uInsertOptionMoongchi2(int newOs_Num);

	boolean deleteOptionMoongchi(String mn_num, String os_optionNum);

	int getOs_Num(String mn_num, String os_optionNum);

	boolean deleteOptionMoongchi2(int getOs_Num);

	boolean deleteOptionValue(String ov_num);

	boolean updateOption(String os_num, String os_name, String mn_num);

	boolean updateOptionValue(String ov_num, String ov_value, String ov_price);



}
