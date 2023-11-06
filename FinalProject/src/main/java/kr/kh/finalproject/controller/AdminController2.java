package kr.kh.finalproject.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import kr.kh.finalproject.service.AdminService;
import kr.kh.finalproject.service.ManagerService;
import kr.kh.finalproject.service.PromotionService;
import kr.kh.finalproject.vo.ManagerVO;
import kr.kh.finalproject.vo.PromotionVO2;

@Controller
public class AdminController2 {

	@Autowired
	AdminService adminService;
	@Autowired
	ManagerService managerService;
	@Autowired
	PromotionService promotionService;
	
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
	
	/** 사업자 승인 */
	@GetMapping("/admin/shop")
	public String adminShop(Model model) {
		// 회원가입 승인여부가 '0'인 사업자회원 리스트 가져와
		List<ManagerVO> bmList = managerService.getBMemberList(0);	
		System.out.println(bmList);
		
		// 화면
		model.addAttribute("bmList", bmList);
		return "/admin/shop";
	}
	
	/** 프로모션 승인 */
	@GetMapping("/admin/promotion")
	public String adminPromotion(Model model) {
		// 프로모션 승인여부가 '0'인 프로모션 리스트 가져와
		List<PromotionVO2> prList = promotionService.getPromotionList(0);
		
		// 화면
		model.addAttribute("prList", prList);
		return "/admin/promotion";
	}
	
	/** 리뷰 등 기타 승인 */
	@GetMapping("/admin/review")
	public String adminReview() {
		
		return "/admin/review";
	}
}
