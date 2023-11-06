package kr.kh.finalproject.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class AdminController {

	@GetMapping("/admin/home")
	public String adminPage() {
//		cri.setPerPageNum(5);
//		List<ManagerVO> managerList = managerService.getManagerList(manager, cri);
//		int totalCount = managerService.getTotalCount(manager, cri);
//		PageMaker pm = new PageMaker(2, cri, totalCount);
//		
//		model.addAttribute("pm", pm);
//		model.addAttribute("manager", managerList);
		return "/admin/home";
	}
	
	@GetMapping("/admin/shop")
	public String adminShop() {
		
		return "/admin/shop";
	}
	
	@GetMapping("/admin/promotion")
	public String adminPromotion() {
		
		return "/admin/promotion";
	}
	
	@GetMapping("/admin/review")
	public String adminReview() {
		
		return "/admin/review";
	}
}
