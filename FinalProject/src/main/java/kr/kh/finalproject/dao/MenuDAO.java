package kr.kh.finalproject.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import kr.kh.finalproject.pagination.Criteria;
import kr.kh.finalproject.vo.ImageVO;
import kr.kh.finalproject.vo.MCategoryVO;
import kr.kh.finalproject.vo.MenuVO;

public interface MenuDAO {
	// 대분류에서 소분류(메뉴들)까지 List
	List<MCategoryVO> selectMenuList(@Param("category")int category);

	List<MenuVO> selectMainList(@Param("st_num")int st_num, @Param("mc_list")int[] mc_numList, @Param("lc_num")int lc_num, @Param("cri")Criteria cri);

	ImageVO selectMenuImage(@Param("mn_num")int mn_num);

	int selectCountMenuList(@Param("st_num")int st_num, @Param("mc_list")int[] mc_numList, @Param("lc_num")int lc_num, @Param("cri")Criteria cri);

	List<MenuVO> getAllMenus();

	// 메뉴 상세 페이지 
	MenuVO selectMenu(@Param("mn_num")int mn_num);
	
	void addMenu(MenuVO menu);
	
}
