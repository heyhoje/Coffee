package kr.kh.finalproject.service;

import java.util.List;

import org.springframework.stereotype.Service;

import kr.kh.finalproject.pagination.Criteria;
import kr.kh.finalproject.vo.MCategoryVO;
import kr.kh.finalproject.vo.MenuVO;

@Service
public interface MenuService {
	
	// 대분류에 맞는 중분류 리스트
	List<MCategoryVO> getMenuList(int category);

	// 중분류에 맞는 메뉴들(mc_numList 배열처리)
	List<MenuVO> getMainList(int st_num, int[] mc_numList, int lc_num, Criteria cri);

	// cri에 매장정보, 메뉴분류 정보 등이 없기 때문에 같이 매개변수로 추가해줘야함. 
	int getTotalCount(int st_num, int[] mc_numList, int lc_num, Criteria cri);

	List<MenuVO> getAllMenus();

	// 메뉴 상세에 메뉴정보 가져오기
	MenuVO getMenu(int mn_num);

	void addMenu(MenuVO menu);
	
}
