package kr.kh.finalproject.controller;

import java.util.Arrays;
import java.util.List;
import java.util.stream.Collectors;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.kh.finalproject.pagination.Criteria;
import kr.kh.finalproject.pagination.PageMaker;
import kr.kh.finalproject.service.BusinessService;
import kr.kh.finalproject.service.MenuService;
import kr.kh.finalproject.service.OptionService;
import kr.kh.finalproject.vo.MCategoryVO;
import kr.kh.finalproject.vo.MenuVO;
import kr.kh.finalproject.vo.OptionVO;

@Controller
public class BusinessController {
	
	@Autowired
	private MenuService menuService;
	@Autowired
	private OptionService optionService;
	@Autowired
	private BusinessService businessService;

	// 사업자페이지 [홈]
	@RequestMapping(value = "/business/home/{a}", method = RequestMethod.GET)
	public String businesspage(@PathVariable("a") int st_num) {

		return "/business/home";
	}

	// 사업자페이지 [메뉴]
	@RequestMapping(value = "/business/menu/{a}/{b}", method = RequestMethod.GET)
	public String menu(Model model, int[] mc_numList, Criteria cri,
			@PathVariable("a") int st_num, @PathVariable("b") int category, Boolean allCheckbox) {
		// 0. @PathVariable로 a, b가 무엇인지 설정~?		
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
				cri.setPerPageNum(8);
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
				//System.out.println(mc_nums);
				// 6. 페이지네이션
				model.addAttribute("pm", pm);
				model.addAttribute("st_num", st_num);
				model.addAttribute("ca_num", category);
		return "/business/realMenu";
	}
	
	
	/** 메뉴상세 */
	@GetMapping("/business/realCRUD/{mn_num}")
	public String realCRUD(Model model, @PathVariable("mn_num") int mn_num) {
		List<OptionVO> option = optionService.getOption(mn_num);
		MenuVO menu = menuService.getMenu(mn_num);
		int st_num = businessService.getSt_num(mn_num);
		
		// 화면에 보여줄 데이터
		model.addAttribute("st_num", st_num);
		model.addAttribute("menu", menu);
		model.addAttribute("option", option);

		return "/business/realCRUD";
	}
	
	
	
	 // 메뉴 삭제 Post
	 @PostMapping("/business/realD")
	 @ResponseBody
	 public String deleteMenu(HttpSession session, @RequestParam("menu_num") String menu_num) {
		 boolean deleteMenu = businessService.deleteMenu(menu_num);
		 boolean deleteOptio = businessService.deleteOption(menu_num);
		 
		 return "/business/realCRUD";
	 }
	 
	 
	 
	 // 메뉴 등록 
	 @RequestMapping(value = "/business/realC/{a}", method = RequestMethod.GET)
	 public String createMenu(@PathVariable("a") int st_num) {
		 
		 
		 return "/business/realC";
	 }
	 
	 // 메뉴 수정 
	 @RequestMapping(value = "/business/realU/{a}/{mn_num}", method = RequestMethod.GET)
	 public String updateMenu(@PathVariable("a") int st_num, Model model, @PathVariable("mn_num") int mn_num) {
		 List<OptionVO> option = optionService.getOption(mn_num);
		 MenuVO menu = menuService.getMenu(mn_num);

		
		 model.addAttribute("menu", menu);
		 model.addAttribute("option", option);
	 
		 return "/business/realU";
	 }
	 
	 // 메뉴 수정 Post
	 @PostMapping("/business/realU")
	 @ResponseBody
	 public String updateMenu(HttpSession session, @RequestParam("mn_num") int mn_num,
			 @RequestParam("mn_name") String mn_name, @RequestParam("mn_price") int mn_price, @RequestParam("mn_contents") String mn_contents,
			 @RequestParam("os_name") String os_name, @RequestParam("optionLists") List<String> optionLists,
			 @RequestParam("optionPriceLists") List<String> optionPriceList) {
		System.out.println(mn_num);
		System.out.println(mn_name); 
		System.out.println(mn_price); 
		System.out.println(mn_contents); 
		System.out.println(os_name); 
		System.out.println(optionLists); 
		System.out.println(optionPriceList); 
		 
		boolean updateMenu = businessService.updateMenu(mn_num, mn_name, mn_price, mn_contents);
		 
		 
		 


		 

		 
		 return "/business/realCRUD";
	 }
	 
	 // 메뉴 수정 옵션추가 Post
	 @PostMapping("/business/realUI")
	 @ResponseBody
	 public String updateInsertOption(@RequestParam("ov_os_num") String ov_os_num) {
		 System.out.println(ov_os_num);
		 
		 boolean uInsertOption = businessService.uInsertOption(ov_os_num);
		 return "";
	 }
	 
	 // 메뉴 수정 옵션뭉치추가 Post
	 @PostMapping("/business/realUII")
	 @ResponseBody
	 public String updateInsertOptionMoongchi(@RequestParam("mn_num") String mn_num) {
		 int maxOptionNum = businessService.getOptionNum(mn_num);
		 maxOptionNum += 1;
		 boolean uInsertOptionMoongchi = businessService.uInsertOptionMoongchi(mn_num, maxOptionNum);
		 int newOs_Num = businessService.getNewOs_Num();
		 boolean uInsertOptionMoongchi2 = businessService.uInsertOptionMoongchi2(newOs_Num);

		 return "";
	 }
	 
	 // 메뉴 수정 옵션뭉치삭제 Post
	 @PostMapping("/business/realUD")
	 @ResponseBody
	 public String deleteOptionMoongchi(@RequestParam("mn_num") String mn_num, @RequestParam("os_optionNum") String os_optionNum) {
		 int getOs_Num = businessService.getOs_Num(mn_num, os_optionNum);
		 boolean deleteOptionMoongchi = businessService.deleteOptionMoongchi(mn_num, os_optionNum);
		 boolean deleteOptionMoongchi2 = businessService.deleteOptionMoongchi2(getOs_Num);
		 return "";
	 }
	 
	 // 메뉴 수정 옵션벨류삭제 Post
	 @PostMapping("/business/realUDV")
	 @ResponseBody
	 public String deleteOptionValue(@RequestParam("ov_num") String ov_num) {
		 boolean deleteOptionValue = businessService.deleteOptionValue(ov_num);
		 return "";
	 }
	 
	 
	 
	 
	 
	

	// 사업자페이지 [주문확인]
	@RequestMapping(value = "/business/order/{a}", method = RequestMethod.GET)
	public String order(@PathVariable("a") int st_num) {

		return "/business/order";
	}

	// 사업자페이지 [매장관리]
	@RequestMapping(value = "/business/store/{a}", method = RequestMethod.GET)
	public String store(@PathVariable("a") int st_num) {

		return "/business/store";
	}

	// 사업자페이지 [판매정보조회]
	@RequestMapping(value = "/business/sales/{a}", method = RequestMethod.GET)
	public String sales(@PathVariable("a") int st_num) {

		return "/business/sales";
	}
}
