package kr.kh.finalproject.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import kr.kh.finalproject.vo.MCategoryVO;
import kr.kh.finalproject.vo.MenuVO;

public interface MenuDAO {

	List<MCategoryVO> selectMenuList(@Param("st_num")int st_num, @Param("category")String category);

	List<MenuVO> selectMainList(@Param("st_num")int st_num, @Param("menu")String menu);

}
