package kr.kh.finalproject.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.kh.finalproject.dao.OptionDAO;
import kr.kh.finalproject.vo.OptionVO;

@Service
public class OptionServiceImp implements OptionService {
	
	@Autowired
	OptionDAO optionDao;

	@Override
	public List<OptionVO> getOption(int mn_num) {
		return optionDao.searchOption(mn_num);
	}

}
