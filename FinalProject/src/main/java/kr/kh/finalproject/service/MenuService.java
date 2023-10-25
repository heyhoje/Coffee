package kr.kh.finalproject.service;

import java.util.List;

import kr.kh.finalproject.vo.MCategoryVO;
import kr.kh.finalproject.vo.MenuVO;

public interface MenuService {

	List<MCategoryVO> getMenuList(int st_num, String category);

	List<MenuVO> getMainList(int st_num, String menu);


}
