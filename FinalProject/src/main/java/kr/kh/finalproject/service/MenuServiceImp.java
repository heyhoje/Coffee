package kr.kh.finalproject.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.kh.finalproject.dao.MenuDAO;
import kr.kh.finalproject.vo.MCategoryVO;
import kr.kh.finalproject.vo.MenuVO;

@Service
public class MenuServiceImp implements MenuService{
	
	@Autowired
	MenuDAO menuDao;

	@Override
	public List<MCategoryVO> getMenuList(int st_num, String category) {
					
		return menuDao.selectMenuList(st_num, category);
	}

	
	@Override
	public List<MenuVO> getMainList(int st_num, String menu) {

		return menuDao.selectMainList(st_num, menu);
	}
}
