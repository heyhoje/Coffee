package kr.kh.finalproject.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.kh.finalproject.dao.MenuDAO;
import kr.kh.finalproject.vo.MCategoryVO;

@Service
public class MenuServiceImp implements MenuService{
	
	@Autowired
	MenuDAO menuDao;

	@Override
	public List<MCategoryVO> getMenuList(int st_num, String category) {
			// null 이면 어떡	하지....?
			// 게시판 복습부터할까? 복습해도 이부분은 모를거같은데....
			
			// 예외처리 할 부분이 없었던 걸까?
		
		return menuDao.selectMenuList(st_num, category);
	}

}
