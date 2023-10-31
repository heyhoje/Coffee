package kr.kh.finalproject.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

import kr.kh.finalproject.service.MenuService;
import kr.kh.finalproject.vo.MCategoryVO;
import kr.kh.finalproject.vo.MenuVO;


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
	public String storeMenu(@PathVariable("a") int st_num, @PathVariable("b") String category, Model model) {
		
		List<MCategoryVO> list = menuService.getMenuList(st_num, category);

		
		model.addAttribute("list", list);
				
		return "/store/menu";
	
	}
	
	
	
}