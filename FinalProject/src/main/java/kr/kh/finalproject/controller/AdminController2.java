package kr.kh.finalproject.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import kr.kh.finalproject.service.ManagerService;
import kr.kh.finalproject.service.PromotionService;
import kr.kh.finalproject.service.ReviewService;
import kr.kh.finalproject.service.StoreService;
import kr.kh.finalproject.vo.ManagerVO;
import kr.kh.finalproject.vo.PromotionVO;
import kr.kh.finalproject.vo.ReviewVO;
import kr.kh.finalproject.vo.StoreVO;

@Controller
public class AdminController2 {

	@Autowired
	ManagerService managerService;
	@Autowired
	PromotionService promotionService;
	@Autowired
	ReviewService reviewService;
	@Autowired
	StoreService storeService;
	
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
	
	/** 사업자 회원가입 승인 */
	@GetMapping("/admin/bmember")
	public String adminBMember(Model model) {
		// 회원가입 승인여부가 '0'인 사업자회원 리스트 가져와
		List<ManagerVO> bmList = managerService.getBMemberList(0);	
		System.out.println(bmList);
		
		// 화면
		model.addAttribute("bmList", bmList);
		return "/admin/bmember";
	}
	
	/** 사업자 매장등록 승인 */
	@GetMapping("/admin/bstore")
	public String adminBStore(Model model) {
		// 매장등록 승인여부가 '0'인 매장 리스트 가져와
		List<StoreVO> bsList = storeService.getBstoreList(0);	
		System.out.println(bsList);
		
		// 화면
		model.addAttribute("bsList", bsList);
		return "/admin/bstore";
	}
	
	/** 프로모션 승인 */
	@GetMapping("/admin/promotion")
	public String adminPromotion(Model model) {
		// 프로모션 승인여부가 '0'인 프로모션 리스트 가져와
		List<PromotionVO> prList = promotionService.getPromotionList(0);
		
		// 화면
		model.addAttribute("prList", prList);
		return "/admin/promotion";
	}
	
	/** 리뷰 등 기타 승인 
	 *  전체 리뷰 리스트를 가져오니까 매개변수 보낼 필요 없겠지? */
	@GetMapping("/admin/review")
	public String adminReview(Model model) {
		List<ReviewVO> reList = reviewService.getReviewList();
		
		model.addAttribute("reList", reList);
		return "/admin/review";
	}
}
