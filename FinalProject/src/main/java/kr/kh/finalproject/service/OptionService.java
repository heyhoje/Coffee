package kr.kh.finalproject.service;

import java.util.List;

import kr.kh.finalproject.vo.OptionVO;

public interface OptionService {

	List<OptionVO> getOption(int mn_num);

}
