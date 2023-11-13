package kr.kh.finalproject.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import kr.kh.finalproject.vo.MemberVO;
import kr.kh.finalproject.vo.Option_ChoiceVO;
import kr.kh.finalproject.vo.ShopVO;
import kr.kh.finalproject.vo.Shop_BasketVO;

public interface BagDAO {

	boolean selectedOption(@Param("selected")String selected, @Param("total")int total, @Param("menu_num")int menu_num, @Param("sb_num")int bagBunho);

	Shop_BasketVO hasBag(@Param("user")MemberVO user);

	void makeBag(@Param("user")MemberVO user);

	int bagBunho(@Param("user")MemberVO user);

	List<Option_ChoiceVO> bagList(@Param("user")MemberVO user);

	boolean deleteItem(@Param("oc_num")int oc_num);

	List<ShopVO> getShopInfo(@Param("user")MemberVO user);

	boolean givePoint(@Param("point")int point, @Param("user")String user);

	

}
