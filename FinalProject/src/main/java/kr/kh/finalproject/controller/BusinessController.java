package kr.kh.finalproject.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import kr.kh.finalproject.service.BusinessService;
import kr.kh.finalproject.service.ManagerService;
import kr.kh.finalproject.service.StoreService;
import kr.kh.finalproject.vo.ManagerVO;

@Controller
public class BusinessController {
	
	@Autowired
	private BusinessService businessService;
	
	// 매장등록( bmember + bstore ) 
	@Autowired
	private ManagerService managerService;
	@Autowired
	private StoreService storeService;

	// 사업자페이지 [홈]
	@RequestMapping(value = "/business/home", method = RequestMethod.GET)
	public String businesspage() {

		return "/business/home";
	}

	// 사업자페이지 [메뉴]
	@RequestMapping(value = "/business/menu", method = RequestMethod.GET)
	public String menu() {

		return "/business/menu";
	}

	// 사업자페이지 [주문확인]
	@RequestMapping(value = "/business/order", method = RequestMethod.GET)
	public String order() {

		return "/business/order";
	}

	// 사업자페이지 [매장관리]
	@RequestMapping(value = "/business/store", method = RequestMethod.GET)
	public String store() {

		return "/business/store";
	}

	// 사업자페이지 [판매정보조회]
	@RequestMapping(value = "/business/sales", method = RequestMethod.GET)
	public String sales() {

		return "/business/sales";
	}
	
	/** 매장 등록 */
	@GetMapping("/business/plusinfo")
	public String plusInfo(HttpSession session, Model model) {
		// ManagerVO buser = managerService.getBMember();
		
		ManagerVO buser = (ManagerVO)session.getAttribute("buser");
		System.out.println(buser);
		
		model.addAttribute("buser", buser);
		return "/business/plusinfo";
	}
	
	@PostMapping("/business/plusinfo")
	public String plusInfoPost() {
		
		
		return "/business/plusinfo";
		
	}
}
