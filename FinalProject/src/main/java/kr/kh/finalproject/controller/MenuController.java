package kr.kh.finalproject.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

import kr.kh.finalproject.pagination.Criteria;
import kr.kh.finalproject.pagination.PageMaker;
import kr.kh.finalproject.service.MenuService;
import kr.kh.finalproject.vo.MCategoryVO;
import kr.kh.finalproject.vo.MenuVO;

@Controller
public class MenuController {

	@Autowired
	MenuService menuService;
	
	/** [ 매장 -> 메뉴 페이지 불러오기 ] 
	 * List<McategoryVO> cList(이제 매장번호가 상관없어진. 중분류도 고정이기 때문)
	 * 대분류에 맞는 중분류 리스트
	 * List<MenuVO> mList
	 * 선택한 중분류들의 메뉴를 가져오는 일
	 * 
	 * category 대분류 정보 => MCategory 중분류정보 (그럼 getCList라고 해야하나 아니다 getMainList하자...
	 * => 소분류(메뉴들) mList(진.짜. MenuVO에 있는 정보에 접근하는 것)
	 * */
	@GetMapping("/store/menu/{a}/{b}")
	public String storeMenu(Model model, int[] mc_numList, 
			@PathVariable("a") int st_num, @PathVariable("b") String category) {
		// 0. @PathVariable로 a, b가 무엇인지 설정~?
			// 5. 페이지네이션 적용

		// 1. 서비스한테 일을 시켰을 때 어떤일을 시켜야할까 고민해야함
		// => 대분류에 맞는 중분류 리스트를 가져오는 일
		List<MCategoryVO> list = menuService.getMenuList(category);
		// 4. => 선택한 중분류들의 메뉴를 가져오는 일
		List<MenuVO> mList = menuService.getMainList(st_num, mc_numList);
		System.out.println(list); // 2. 리스트를 잘 가져왔는지 확인
		
		// 3. 서버 to 화면으로 보내기
		// model.addAttribute("화면에 보여질 이름", 변수명); 
		// .jsp파일에서 ${list}, ${menuList}로 화면에 전송되고 있는지 확인 
		model.addAttribute("list", list);
		model.addAttribute("menuList", mList);
				
		return "/store/menu";
	}
	
}