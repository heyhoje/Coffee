package kr.kh.finalproject.dao;

import org.apache.ibatis.annotations.Param;

public interface BusinessDAO {

	boolean deleteMenu(@Param("menu_num")String menu_num);

	boolean deleteOption(@Param("menu_num")String menu_num);

	Integer getSt_num(@Param("mn_num")Integer mn_num);

	boolean updateMenu(@Param("mn_num")String mn_num, @Param("mn_name")String mn_name, @Param("mn_price")String mn_price, @Param("mn_contents")String mn_contents);

	boolean uInsertOption(@Param("ov_os_num")String ov_os_num);

	int getOptionNum(@Param("mn_num")String mn_num);

	boolean uInsertOptionMoongchi(@Param("mn_num")String mn_num, @Param("os_optionNum")int maxOptionNum);

	int getNewOs_Num();

	boolean uInsertOptionMoongchi2(@Param("os_num")int newOs_Num);

	boolean deleteOptionMoongchi(@Param("mn_num")String mn_num, @Param("os_optionNum")String os_optionNum);

	int getOs_Num(@Param("mn_num")String mn_num, @Param("os_optionNum")String os_optionNum);

	boolean deleteOptionMoongchi2(@Param("os_num")int getOs_Num);

	boolean deleteOptionValue(@Param("ov_num")String ov_num);

	boolean updateOption(@Param("os_num")String os_num, @Param("os_name")String os_name, @Param("mn_num")String mn_num);

	boolean updateOptionValue(@Param("ov_num")String ov_num, @Param("ov_value")String ov_value, @Param("ov_price")String ov_price);

	boolean makeMenuMijung(@Param("st_num")String st_num);

	int getMijungMn_num();

	boolean makeOptionMijung(@Param("mn_num")int mn_num);

	boolean makeOptionValueMijung(@Param("st_num")int os_num);

	int getMn_num();



}
