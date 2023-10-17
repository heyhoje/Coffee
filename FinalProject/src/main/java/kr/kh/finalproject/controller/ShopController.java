package kr.kh.finalproject.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import kr.kh.finalproject.service.ShopService;
import kr.kh.finalproject.vo.ShopVO;


@Controller
public class ShopController {
	
	@Autowired
	private ShopService shopService;
	
	@RequestMapping(value = "/shop", method = RequestMethod.GET)
	public String searchShop(HttpSession session, HttpServletRequest request) throws Exception {
	
		return "/shop/search";
	}
	
	@RequestMapping(value = "/shop/name", method = RequestMethod.GET)
	public String searchName(HttpSession session, HttpServletRequest request) throws Exception {
	
		return "/shop/searchName";
	}
	
	@PostMapping(value="/shop/name")
	public String searchNameList(HttpServletRequest request, ShopVO shop) {
		String searchName = request.getParameter("search_name");
		shopService.searchShop(searchName);
		return "/shop/searchName";
	}
}
