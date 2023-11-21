package kr.kh.finalproject.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import kr.kh.finalproject.vo.ManagerVO;
import kr.kh.finalproject.vo.MemberVO;
import kr.kh.finalproject.vo.Option_ChoiceVO;
import kr.kh.finalproject.vo.Shop_BasketVO;

public interface BagDAO {

	boolean selectedOption(@Param("selected")String selected, @Param("total")int total, @Param("menu_num")int menu_num, @Param("sb_num")int bagBunho);

	Shop_BasketVO hasBag(@Param("user")MemberVO user);

	void makeBag(@Param("user")MemberVO user);

	int bagBunho(@Param("user")MemberVO user);

	List<Option_ChoiceVO> bagList(@Param("user")MemberVO user);

	boolean deleteItem(@Param("oc_num")int oc_num);

	List<ManagerVO> getShopInfo(@Param("user")MemberVO user);

	boolean givePoint(@Param("givePoint")int givdPoint, @Param("user")String user);

	int getPoint(@Param("user")MemberVO user);

	boolean backPoint(@Param("usePoint")int usePoint, @Param("user")String user);

	boolean killBag(@Param("user")String user);

	boolean makeOrderMenu(@Param("menuName")String menuName, @Param("menuNum")String menuNum);

	int getBasketNum(@Param("user")MemberVO user);
	
	int getNumFromOM();

	boolean makeOrderList(@Param("user")String user, @Param("or_num")int getNumFromOM, @Param("sb_num")int getSbNum);

	int getBasketNum1(@Param("user")String user);

	int sameShop(@Param("user")MemberVO user);

	int anotherShop(@Param("menu_num")int menu_num);

	boolean flipBag(@Param("user")MemberVO user);


}
