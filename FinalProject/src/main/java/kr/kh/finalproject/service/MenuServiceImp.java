package kr.kh.finalproject.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.kh.finalproject.dao.MenuDAO;
import kr.kh.finalproject.pagination.Criteria;
import kr.kh.finalproject.vo.MCategoryVO;
import kr.kh.finalproject.vo.MenuVO;

@Service
public class MenuServiceImp implements MenuService{
	
	@Autowired
	MenuDAO menuDao;

	/** 대분류category 에 맞는 중분류 정보 menuList */
	@Override
	public List<MCategoryVO> getMenuList(int category) {
					
		return menuDao.selectMenuList(category);
	}

	/** 중분류...에 맞는 메뉴들 정보 mc_numList */
	@Override
	public List<MenuVO> getMainList(int st_num, int[] mc_numList, int lc_num, Criteria cri) {
		if(cri == null) {
			cri = new Criteria();
		}
		return menuDao.selectMainList(st_num, mc_numList, lc_num, cri);
	}
		
	
	/** 페이지네이션 */
	@Override
	public int getTotalCount(int st_num, int[] mc_numList, int lc_num, Criteria cri) {
		if(cri == null) {
			cri = new Criteria();
		}
		return menuDao.selectCountMenuList(st_num, mc_numList, lc_num, cri);
	}
}
