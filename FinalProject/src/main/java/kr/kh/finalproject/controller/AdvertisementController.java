package kr.kh.finalproject.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import kr.kh.finalproject.pagination.Criteria;
import kr.kh.finalproject.pagination.PageMaker;
import kr.kh.finalproject.service.AdvertisementService;
import kr.kh.finalproject.vo.AdvertisementVO;

@Controller
public class AdvertisementController {
	
	@Autowired
	AdvertisementService advertisementService;
	
	@GetMapping("/promotion/list")
	public String advertisementList(Model model, Criteria cri) {
		cri.setPerPageNum(5);
		List<AdvertisementVO> advertisementList = advertisementService.getAdvertisementList(cri);
		int totalCount = advertisementService.getTotalCount(cri);
		PageMaker pm = new PageMaker(2, cri, totalCount);
		
		
		model.addAttribute("pm", pm);
		model.addAttribute("advertisementList", advertisementList);
		return "/promotion/list";
		
	}
}
