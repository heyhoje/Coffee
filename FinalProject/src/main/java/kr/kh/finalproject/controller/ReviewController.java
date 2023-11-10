package kr.kh.finalproject.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import kr.kh.finalproject.service.ReviewService;

@Controller
public class ReviewController {

	@Autowired
	ReviewService reviewService;
}
