package kr.kh.finalproject.controller;

import java.util.Arrays;
import java.util.List;
import java.util.stream.Collectors;

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
	
	/** [ 매장 -> 메뉴 페이지 불러오기 ] 
	 * List<McategoryVO> list(이제 매장번호st_num가 상관없어진. 중분류도 고정이기 때문)
	 * 대분류에 맞는 중분류 리스트
	 * List<MenuVO> mList
	 * 선택한 중분류들의 메뉴를 가져오는 일
	 * 
	 * category 대분류 정보 => MCategory 중분류정보 (그럼 getList라고 해야하나 아니다 getMainList하자...
	 * => 소분류(메뉴들) mList(진.짜. MenuVO에 있는 정보에 접근하는 것)
	 * */
	@GetMapping("/store/menu/{a}/{b}")
	public String storeMenu(Model model, int[] mc_numList, 
			@PathVariable("a") int st_num, @PathVariable("b") int category, Boolean allCheckbox) {
		// 0. @PathVariable로 a, b가 무엇인지 설정~?		
		// 1. 서비스한테 일을 시켰을 때 어떤일을 시켜야할까 고민해야함
		// => 대분류에 맞는 중분류 리스트를 가져오는 일
		List<MCategoryVO> list = menuService.getMenuList(category);
		// 4. => 선택한 중분류들의 메뉴를 가져오는 일
		List<MenuVO> mList = menuService.getMainList(st_num, mc_numList, category);
		System.out.println(list); // 2. 리스트를 잘 가져왔는지 확인
		
		// 5. *체크박스 작업 : 정수배열을 정수리스트로 바꿔주는 코드 - (이유)배열은 기능을 제공하지 않기 때문에 리스트로 바꿨다.
		List<Object> mc_nums = mc_numList != null ? Arrays.stream(mc_numList)
                .boxed()
                .collect(Collectors.toList()): null;
		
		// 3. 서버 to 화면으로 보내기
		// model.addAttribute("화면에 보여질 이름", 변수명); 
		// .jsp파일에서 ${list}, ${menuList}로 화면에 전송되고 있는지 확인 
		model.addAttribute("list", list);
		model.addAttribute("menuList", mList);
		model.addAttribute("mc_nums", mc_nums);
		// 5. 전체 체크를 위해 추가
		model.addAttribute("allCheckbox", allCheckbox);
		System.out.println(mc_nums);
		return "/store/menu";
	}
	
}