package kr.kh.finalproject.dao;

import org.apache.ibatis.annotations.Param;

public interface ShopDAO {

	void searchShopName(@Param("name")String searchName);

}
