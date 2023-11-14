package kr.kh.finalproject.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import kr.kh.finalproject.service.ReviewService;
import kr.kh.finalproject.vo.ReviewVO;

@Controller
public class ReviewController {

	@Autowired
	ReviewService reviewService;
	
	/** 리뷰 게시판 */
	@GetMapping("/main/review")
	public String getReview(Model model) {
		List<ReviewVO> rvList = reviewService.getRvList();
		
		model.addAttribute("rvList", rvList);
		return "/main/review"; 
	}
}
