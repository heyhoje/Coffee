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
	
	/** 매장 -> 메뉴 페이지 불러오기 */
	@GetMapping("/store/menu/{a}/{b}")
	public String storeMenu(Model model, String menu, @PathVariable("a") int st_num, @PathVariable("b") String category) {
		// 0. @PathVariable로 a, b가 무엇인지 설정~?
		
		// 1. 서비스한테 일을 시켰을 때 어떤일을 시켜야할까 고민해야함
		// => 메뉴 리스트 [ 카테고리분류 / 메인메뉴 ]
		List<MCategoryVO> cList = menuService.getMenuList(st_num, category);
		List<MenuVO> mList = menuService.getMainList(st_num, menu);
		System.out.println(cList); // 2. 리스트를 잘 가져왔는지 확인

		// 3. 서버 to 화면으로 보내기
		// model.addAttribute("화면에 보여질 이름", 변수명);
		model.addAttribute("list", cList);
		model.addAttribute("menuList", mList);
				
		return "/store/menu";
	}
	
}