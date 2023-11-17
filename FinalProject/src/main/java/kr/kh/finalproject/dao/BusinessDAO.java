package kr.kh.finalproject.dao;

import org.apache.ibatis.annotations.Param;

public interface BusinessDAO {

	boolean deleteMenu(@Param("menu_num")String menu_num);

	boolean deleteOption(@Param("menu_num")String menu_num);

	int getSt_num(@Param("mn_num")int mn_num);

	boolean updateMenu(@Param("mn_num")int mn_num, @Param("mn_name")String mn_name, @Param("mn_price")int mn_price, @Param("mn_contents")String mn_contents);

}
