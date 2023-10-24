package kr.kh.finalproject.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;

import kr.kh.finalproject.service.MenuService;
import kr.kh.finalproject.vo.MCategoryVO;

@Controller
public class MenuController {

	@Autowired
	MenuService menuService;
//	
//	@RequestMapping(value="/menu/starbucks", method=RequestMethod.GET)
//	public String signup() {
//		
//		return "/menu/starbucks";
//	}
	
	@GetMapping("/store/menu/{a}/{b}")
	public String storeMenu() {
		// 0. @PathVariable로 a, b가 무엇인지 설정~?
		// 1. 서비스한테 일을 시켰을 때 어떤일을 시켜야할까 고민해야함
		// => 메뉴 리스트를 가져다줘??? 
		List<MCategoryVO> list = menuService.getMenuList(st_num, category);
		
		return "/store/menu";
	}
	
}