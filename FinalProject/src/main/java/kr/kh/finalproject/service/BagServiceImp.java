package kr.kh.finalproject.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.kh.finalproject.dao.BagDAO;
import kr.kh.finalproject.dao.ShopDAO;
import kr.kh.finalproject.vo.MemberVO;
import kr.kh.finalproject.vo.Option_ChoiceVO;
import kr.kh.finalproject.vo.ShopVO;
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
	public boolean hasBag(MemberVO user) {
		Shop_BasketVO hasBag = bagDao.hasBag(user);
		if(hasBag == null) {
			return false;
		}
		return true;
	}

	@Override
	public boolean makeBag(MemberVO user) {
		bagDao.makeBag(user);
		return true;
	}

	@Override
	public int bagBunho(MemberVO user) {
		int sb_num = bagDao.bagBunho(user);
		return sb_num;
	}

	@Override
	public List<Option_ChoiceVO> bagList(MemberVO user) {
		return bagDao.bagList(user);
	}

	@Override
	public boolean deleteItem(int oc_num) {
		return bagDao.deleteItem(oc_num);
	}

	@Override
	public List<ShopVO> shopInfo(MemberVO user) {	
		return bagDao.getShopInfo(user);
	}

	@Override
	public boolean givePoint(int point, String user) {
		return bagDao.givePoint(point, user);
	}


}
