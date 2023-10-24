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
	public String storeMenu(@PathVariable("a") int st_num, @PathVariable("b") String category, Model model) {
		// 0. @PathVariable로 a, b가 무엇인지 설정~?
		// 1. 서비스한테 일을 시켰을 때 어떤일을 시켜야할까 고민해야함
		// => 메뉴 리스트를 가져다줘??? 
		List<MCategoryVO> list = menuService.getMenuList(st_num, category);
		System.out.println(list); // 2. 리스트를 잘 가져왔는지 확인

		// 3. 서버 to 화면으로 보내기
		model.addAttribute("list", list);
				
		return "/store/menu";
	}
	
}