package kr.kh.finalproject.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.kh.finalproject.dao.ReviewDAO;
import kr.kh.finalproject.vo.ReviewVO;

@Service
public class ReviewServiceImp implements ReviewService{

	@Autowired
	ReviewDAO reviewDao;

	@Override
	public List<ReviewVO> getReviewList() {

		return reviewDao.selectReList();
	}
}
