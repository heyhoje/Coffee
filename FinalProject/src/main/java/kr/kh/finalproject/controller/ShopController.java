package kr.kh.finalproject.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class ShopController {
	
	@RequestMapping(value = "/shop", method = RequestMethod.GET)
	public String write(HttpSession session, HttpServletRequest request) throws Exception {
	
		return "shop/search";
	}
	
}
