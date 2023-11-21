package kr.kh.finalproject.service;

import java.util.List;

import kr.kh.finalproject.vo.ManagerVO;
import kr.kh.finalproject.vo.MemberVO;
import kr.kh.finalproject.vo.Option_ChoiceVO;

public interface BagService {

	boolean selectedOption(String selected, int total, int menu_num, int bagBunho);

	boolean hasBag(MemberVO user);

	boolean makeBag(MemberVO user);

	int bagBunho(MemberVO user);

	List<Option_ChoiceVO> bagList(MemberVO user);

	boolean deleteItem(int oc_num);

	List<ManagerVO> shopInfo(MemberVO user);

	boolean givePoint(int givePoint, String user);

	int getPoint(MemberVO user);

	boolean steelPoint(int usePoint, String user);

	boolean killBag(String user);

	boolean makeOrderMenu(String menuName, String menuNum);

	int getBasketNum(MemberVO user);
	
	int getNumFromOM();

	boolean makeOrderList(String user, int getNumFromOM, int getSbNum);

	int getBasketNum1(String user);

	int sameShop(MemberVO user);

	int anotherShop(int menu_num);

	boolean flipBag(MemberVO user);



}
