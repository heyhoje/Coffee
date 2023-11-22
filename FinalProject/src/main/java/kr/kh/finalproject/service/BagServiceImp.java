package kr.kh.finalproject.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.kh.finalproject.dao.BagDAO;
import kr.kh.finalproject.vo.ManagerVO;
import kr.kh.finalproject.vo.MemberVO;
import kr.kh.finalproject.vo.Option_ChoiceVO;
import kr.kh.finalproject.vo.Shop_BasketVO;

@Service
public class BagServiceImp implements BagService{
	
	@Autowired
	BagDAO bagDao;
	
	@Override
	public boolean selectedOption(String selected, int total, int menu_num, int bagBunho) {
		bagDao.selectedOption(selected, total, menu_num, bagBunho);
		return true;
	}

	@Override
	public boolean hasBag(String id) {
		Shop_BasketVO hasBag = bagDao.hasBag(id);
		if(hasBag == null) {
			return false;
		}
		return true;
	}

	@Override
	public boolean makeBag(String id) {
		bagDao.makeBag(id);
		return true;
	}

	@Override
	public int bagBunho(String id) {
		int sb_num = bagDao.bagBunho(id);
		return sb_num;
	}

	@Override
	public List<Option_ChoiceVO> bagList(String id) {
		return bagDao.bagList(id);
	}

	@Override
	public boolean deleteItem(int oc_num) {
		return bagDao.deleteItem(oc_num);
	}

	@Override
	public List<ManagerVO> shopInfo(String id) {	
		return bagDao.getShopInfo(id);
	}

	@Override
	public boolean givePoint(int givePoint, String id) {
		return bagDao.givePoint(givePoint, id);
	}

	@Override
	public int getPoint(String id) {
		return bagDao.getPoint(id);
	}

	@Override
	public boolean steelPoint(int usePoint, String id) {
		return bagDao.backPoint(usePoint, id);
	}

	@Override
	public boolean killBag(String id) {
		return bagDao.killBag(id);
	}

	@Override
	public boolean makeOrderMenu(String menuName, String menuNum) {
		return bagDao.makeOrderMenu(menuName, menuNum);
	}

	@Override
	public int getBasketNum(String id) {
		return bagDao.getBasketNum(id);
	}
	
	@Override
	public int getNumFromOM() {
		return bagDao.getNumFromOM();
	}

	@Override
	public boolean makeOrderList(String id, int getNumFromOM, int getSbNum) {
		return bagDao.makeOrderList(id, getNumFromOM, getSbNum);
	}


	@Override
	public int getBasketNum1(String id) {
		return bagDao.getBasketNum1(id);
	}

	@Override
	public int sameShop(MemberVO user) {
		return bagDao.sameShop(user);
	}

	@Override
	public int anotherShop(int menu_num) {
		return bagDao.anotherShop(menu_num);
	}

	@Override
	public boolean flipBag(MemberVO user) {
		return bagDao.flipBag(user);
	}


}
