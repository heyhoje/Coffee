package kr.kh.finalproject.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import kr.kh.finalproject.pagination.Criteria;
import kr.kh.finalproject.service.ShopService;
import kr.kh.finalproject.vo.ManagerVO;


@Controller
public class ShopController {
	
	@Autowired
	private ShopService shopService;
	
	@RequestMapping(value = "/shop", method = RequestMethod.GET)
	public String searchShop(HttpSession session, HttpServletRequest request) {
	
		return "/shop/search";
	}
	
	@RequestMapping(value = "/shop/name", method = RequestMethod.GET)
	public String searchName(HttpSession session, Model model, Criteria cri, Double ipLati, Double ipLongi) {
		System.out.println(ipLati);
		System.out.println(ipLongi);
		cri.setPerPageNum(10);
		//서비스에게 게시글 리스트를 가져오라고 시킴
		List<ManagerVO> shopList = shopService.getShopList(cri);
		// 위도, 경도의 정보가 둘다 null이 아닐 경우 거리 계산을 실행
		if(ipLati != null && ipLongi != null) {
			shopList = shopService.getShopList(cri, ipLati, ipLongi);
		}
		System.out.println(shopList);
		//가져온 리스트를 화면에 전송 
		model.addAttribute("shopList", shopList);
		return "/shop/searchName";
	}

	
	@PostMapping(value="/shop/name")
	public String searchNameList(HttpServletRequest request, ManagerVO shop) {
		String searchName = request.getParameter("search_name");
		shopService.searchShop(searchName);
		return "/shop/searchName";
	}
}
