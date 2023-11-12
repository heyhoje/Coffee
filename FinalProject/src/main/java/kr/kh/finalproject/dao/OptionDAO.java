package kr.kh.finalproject.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import kr.kh.finalproject.vo.OptionVO;
import kr.kh.finalproject.vo.Option_ValueVO;

public interface OptionDAO {

	List<OptionVO> searchOption(@Param("mn_num")int mn_num);
}
