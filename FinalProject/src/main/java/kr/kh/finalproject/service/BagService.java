package kr.kh.finalproject.service;

import java.util.List;

import kr.kh.finalproject.vo.MemberVO;
import kr.kh.finalproject.vo.Option_ChoiceVO;
import kr.kh.finalproject.vo.ShopVO;
import kr.kh.finalproject.vo.Shop_BasketVO;
import kr.kh.finalproject.vo.StoreVO;

public interface BagService {

	boolean selectedOption(String selected, int total, int menu_num, int bagBunho);

	boolean hasBag(MemberVO user);

	boolean makeBag(MemberVO user);

	int bagBunho(MemberVO user);

	List<Option_ChoiceVO> bagList(MemberVO user);

	boolean deleteItem(int oc_num);

	List<ShopVO> shopInfo(MemberVO user);

	boolean givePoint(int point, String user);


}
