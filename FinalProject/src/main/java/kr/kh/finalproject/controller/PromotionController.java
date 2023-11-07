package kr.kh.finalproject.controller;



import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import kr.kh.finalproject.pagination.Criteria;
import kr.kh.finalproject.pagination.PageMaker;
import kr.kh.finalproject.service.PromotionService;
import kr.kh.finalproject.vo.PromotionVO;

@Controller
public class PromotionController {
	
	@Autowired
	PromotionService promotionService;
	

	
	@GetMapping("/promotion/list")
	public String promotionList(Model model, Criteria cri) {
		cri.setPerPageNum(5);
		List<PromotionVO> promotionList = promotionService.getPromotionList(cri);
		int totalCount = promotionService.getTotalCount(cri);
		PageMaker pm = new PageMaker(2, cri, totalCount);
		
		
		model.addAttribute("pm", pm);
		model.addAttribute("promotionList", promotionList);
		return "/promotion/list";
		
	}
}