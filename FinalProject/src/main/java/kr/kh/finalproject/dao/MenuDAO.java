package kr.kh.finalproject.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import kr.kh.finalproject.vo.MCategoryVO;

public interface MenuDAO {

	List<MCategoryVO> selectMenuList(@Param("st_num")int st_num, @Param("category")String category);

}
