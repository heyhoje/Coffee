package kr.kh.finalproject.service;

import java.util.List;

import kr.kh.finalproject.vo.MCategoryVO;

public interface MenuService {

	List<MCategoryVO> getMenuList(int st_num, String category);


}
