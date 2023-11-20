package kr.kh.finalproject.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import kr.kh.finalproject.service.ReviewService;
import kr.kh.finalproject.vo.MemberVO;
import kr.kh.finalproject.vo.OrderMenuVO;
import kr.kh.finalproject.vo.ReviewVO;

@Controller
public class ReviewController {

	@Autowired
	ReviewService reviewService;
	
	/** 리뷰 게시판 */
	@GetMapping("/review/list")
	public String getReview(Model model) {
		List<ReviewVO> rvList = reviewService.getRvList();
		
		model.addAttribute("rvList", rvList);
		return "/review/list"; 
	}
	
	/** 주문내역 리스트 order_menu */
	/** 리뷰 등록 */
	@GetMapping("/review/insert")
	public String insertReview(Model model, HttpSession session) {
		List<OrderMenuVO> orderList = reviewService.getOrderList();
		System.out.println(orderList);
		// 주문메뉴번호 주문시간 주문상태(완료가 된 음료만 리뷰를 남길 수 있겠지...) 주문메뉴이름 주문메뉴번호
		// 어떡하냐.... 연계된게 또 생겨버렸다리?????
		
		// HttpSession에 orderList를 "orderList"라는 이름으로 저장
	    session.setAttribute("order", orderList);
	    
		model.addAttribute("orderList", orderList);
		return "/review/insert";
	}
	
	@PostMapping("/review/insert")
	public String insertReviewPost(Model model, ReviewVO review, HttpSession session) {
		
		// MemberVO user = (MemberVO)session.getAttribute("user"); // 리뷰를 남기는 사용자... 필요없나...?
		OrderMenuVO order = (OrderMenuVO) session.getAttribute("order"); // 이렇게 하면 지금. 저장 된건가??? 그치????아닌가....
		// System.out.println(order); order를 확인해볼 방법 어디 없나, 사람이 찾으려다 끊임없이 덧나
		// 세션에 없어서인줄알고, GetMapping에 세션저장도 해보았지만.. 여기는 내 손을 떠나고 있는듯하다...
		
		// List<OrderMenuVO> orderList = (List<OrderMenuVO>) session.getAttribute("order");
		// 리스트로 불러오는것도 아닌가봐.....
		if(order == null) {
			model.addAttribute("msg", "주문 정보를 찾을 수 없습니다. 다시 주문해주세요.");
		    model.addAttribute("url", "/review/list"); // 적절한 URL로 변경
		    return "main/message";
		}
		
		boolean res = reviewService.insertReview(review, order);
		
		if(res) {
			model.addAttribute("msg", "리뷰등록에 성공했습니다! 감사합니다");
			model.addAttribute("url", "review/list");
		}else {
			model.addAttribute("msg", "리뷰등록에 실패했습니다. 다시 남겨주실래요?");
			model.addAttribute("url", "review/insert");
		}
		return "/main/message";
	}
}
