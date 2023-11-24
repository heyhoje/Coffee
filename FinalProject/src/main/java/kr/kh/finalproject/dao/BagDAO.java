package kr.kh.finalproject.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import kr.kh.finalproject.vo.ManagerVO;
import kr.kh.finalproject.vo.MemberVO;
import kr.kh.finalproject.vo.Option_ChoiceVO;
import kr.kh.finalproject.vo.OrderMenuVO;
import kr.kh.finalproject.vo.Shop_BasketVO;

public interface BagDAO {

	boolean selectedOption(@Param("selected")String selected, @Param("total")int total, @Param("menu_num")int menu_num, @Param("sb_num")int bagBunho);

	Shop_BasketVO hasBag(@Param("id")String id);

	void makeBag(@Param("id")String id);

	int bagBunho(@Param("id")String id);

	List<Option_ChoiceVO> bagList(@Param("id")String id);

	boolean deleteItem(@Param("oc_num")int oc_num);

	List<ManagerVO> getShopInfo(@Param("id")String id);

	boolean givePoint(@Param("givePoint")int givdPoint, @Param("id")String id);

	int getPoint(@Param("id")String id);

	boolean backPoint(@Param("usePoint")int usePoint, @Param("id")String id);

	boolean killBag(@Param("id")String id);

	boolean makeOrderMenu(@Param("menuName")String menuName, @Param("menuNum")String menuNum, @Param("selectOption")String selectOption);

	int getBasketNum(@Param("id")String id);
	
	int getNumFromOM();

	boolean makeOrderList(@Param("id")String id, @Param("or_num")int getNumFromOM, @Param("sb_num")int getSbNum);

	int getBasketNum1(@Param("id")String id);

	int sameShop(@Param("id")MemberVO user);

	int anotherShop(@Param("menu_num")int menu_num);

	boolean flipBag(@Param("id")MemberVO user);

	OrderMenuVO getOrderMenu(@Param("id")String id);

}
