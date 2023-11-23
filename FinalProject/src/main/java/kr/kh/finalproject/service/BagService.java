package kr.kh.finalproject.service;

import java.util.List;

import kr.kh.finalproject.vo.ManagerVO;
import kr.kh.finalproject.vo.MemberVO;
import kr.kh.finalproject.vo.Option_ChoiceVO;
import kr.kh.finalproject.vo.OrderMenuVO;

public interface BagService {

	boolean selectedOption(String selected, int total, int menu_num, int bagBunho);

	boolean hasBag(String id);

	boolean makeBag(String id);

	int bagBunho(String id);

	List<Option_ChoiceVO> bagList(String id);

	boolean deleteItem(int oc_num);

	List<ManagerVO> shopInfo(String id);

	boolean givePoint(int givePoint, String id);

	int getPoint(String id);

	boolean steelPoint(int usePoint, String id);

	boolean killBag(String id);

	boolean makeOrderMenu(String menuName, String menuNum, String selectOption);

	int getBasketNum(String id);
	
	int getNumFromOM();

	boolean makeOrderList(String id, int getNumFromOM, int getSbNum);

	int getBasketNum1(String id);

	int sameShop(MemberVO user);

	int anotherShop(int menu_num);

	boolean flipBag(MemberVO user);

	OrderMenuVO getOrderMenu(String id);



}
