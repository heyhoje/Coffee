package kr.kh.finalproject.controller;

import java.util.Arrays;
import java.util.List;
import java.util.stream.Collectors;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import kr.kh.finalproject.pagination.Criteria;
import kr.kh.finalproject.pagination.PageMaker;
import kr.kh.finalproject.service.MenuService;
import kr.kh.finalproject.service.OptionService;
import kr.kh.finalproject.vo.MCategoryVO;
import kr.kh.finalproject.vo.MenuVO;
import kr.kh.finalproject.vo.OptionVO;

@Controller
public class MenuController {

	@Autowired
	MenuService menuService;
	
	@Autowired
	OptionService optionService;
	
	/** [ 매장 -> 메뉴 페이지 불러오기 ] 
	 * List<McategoryVO> list(이제 매장번호st_num가 상관없어진. 중분류도 고정이기 때문)
	 * 대분류에 맞는 중분류 리스트
	 * List<MenuVO> mList
	 * 선택한 중분류들의 메뉴를 가져오는 일
	 * 
	 * category 대분류 정보 => MCategory 중분류정보 
	 * => 소분류(메뉴들) mList(진.짜. MenuVO에 있는 정보에 접근하는 것)
	 * */
	@GetMapping("/store/menu/{a}/{b}")
	public String storeMenu(Model model, int[] mc_numList, Criteria cri,
			@PathVariable("a") int st_num, @PathVariable("b") int category, Boolean allCheckbox) {
		// 1. 서비스한테 일을 시켰을 때 어떤일을 시켜야할까 고민해야함
		// => 대분류에 맞는 중분류 리스트를 가져오는 일
		List<MCategoryVO> list = menuService.getMenuList(category);
		// 4. => 선택한 중분류들의 메뉴를 가져오는 일
		List<MenuVO> mList = menuService.getMainList(st_num, mc_numList, category, cri);
		//System.out.println(list); // 2. 리스트를 잘 가져왔는지 확인
		
		// 6. 현재 페이지 정보에 맞는 전체 게시글 수를 가져옴
		int totalCount = menuService.getTotalCount(st_num, mc_numList, category, cri);
		// 6. 페이지네이션 페이지수
		final int DISPLAY_PAGE_NUM = 8;
		PageMaker pm = new PageMaker(DISPLAY_PAGE_NUM, cri, totalCount);
		
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
		// 6. 페이지네이션
		model.addAttribute("pm", pm);
		model.addAttribute("st_num", st_num);
		model.addAttribute("ca_num", category);
		return "/store/menu";
	
	}
	 
	/** 메뉴상세 */
	@GetMapping("/store/detail/{mn_num}")
	public String storeDetail(Model model, @PathVariable("mn_num") int mn_num) {
		List<OptionVO> option = optionService.getOption(mn_num);
		MenuVO menu = menuService.getMenu(mn_num);
		//System.out.println(menu);
		//System.out.println(option);

		
		// 화면에 보여줄 데이터
		model.addAttribute("menu", menu);
		model.addAttribute("option", option);

		return "/store/detail";
	}
	
	@RequestMapping(value = "/addMenuAndOptions", method = RequestMethod.POST)
	public void addMenu(@RequestBody MenuVO menuVO) {
        // 여기에서 MenuVO를 Menu 엔티티로 변환하여 저장
        MenuVO menu = new MenuVO();
        menu.setMn_name(menuVO.getMn_name());
        menu.setMn_price(menuVO.getMn_price());
        menu.setMn_contents(menuVO.getMn_contents());
        // 나머지 필드 설정

        // 메뉴 서비스를 통해 저장
        menuService.addMenu(menu);
    }
}