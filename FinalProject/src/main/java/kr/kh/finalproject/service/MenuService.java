package kr.kh.finalproject.service;

import java.util.List;

import kr.kh.finalproject.pagination.Criteria;
import kr.kh.finalproject.vo.MCategoryVO;
import kr.kh.finalproject.vo.MenuVO;

public interface MenuService {
	
	// 대분류에 맞는 중분류 리스트
	List<MCategoryVO> getMenuList(String category);

	// 중분류에 맞는 메뉴들(mc_numList 배열처리)
	List<MenuVO> getMainList(int st_num, int[] mc_numList);


}
