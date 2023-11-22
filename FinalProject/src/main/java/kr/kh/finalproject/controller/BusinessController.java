package kr.kh.finalproject.controller;

import java.util.ArrayList;
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
import org.springframework.web.multipart.MultipartFile;

import kr.kh.finalproject.pagination.Criteria;
import kr.kh.finalproject.pagination.PageMaker;
import kr.kh.finalproject.service.BusinessService;
import kr.kh.finalproject.service.MenuService;
import kr.kh.finalproject.service.OptionService;
import kr.kh.finalproject.service.StoreService;
import kr.kh.finalproject.vo.MCategoryVO;
import kr.kh.finalproject.vo.ManagerVO;
import kr.kh.finalproject.vo.MenuVO;
import kr.kh.finalproject.vo.OptionVO;
import kr.kh.finalproject.vo.StoreVO;


@Controller
public class BusinessController {
	
	
	/** 매장등록( bmember + bstore ) */ 
	@Autowired
	private BusinessService businessService;
	@Autowired
	private StoreService storeService;

	/** 메뉴/옵션 */
	@Autowired
	private MenuService menuService;
	@Autowired
	private OptionService optionService;


	// 사업자페이지 [홈]
	@RequestMapping(value = "/business/home", method = RequestMethod.GET)
	public String businesspage() {

		return "/business/home";
	}

	// 사업자페이지 [메뉴]
	@RequestMapping(value = "/business/menu/{a}/{b}", method = RequestMethod.GET)
	public String menu(Model model, int[] mc_numList, Criteria cri,
			@PathVariable("a") int st_num, @PathVariable("b") int category, Boolean allCheckbox) {

				List<MCategoryVO> list = menuService.getMenuList(category);
				List<MenuVO> mList = menuService.getMainList(st_num, mc_numList, category, cri);
				//System.out.println(list);
				
				int totalCount = menuService.getTotalCount(st_num, mc_numList, category, cri);

				final int DISPLAY_PAGE_NUM = 8;
				cri.setPerPageNum(8);
				PageMaker pm = new PageMaker(DISPLAY_PAGE_NUM, cri, totalCount);
				
				List<Object> mc_nums = mc_numList != null ? Arrays.stream(mc_numList)
		                .boxed()
		                .collect(Collectors.toList()): null;
					
				model.addAttribute("list", list);
				model.addAttribute("menuList", mList);
				model.addAttribute("mc_nums", mc_nums);
				
				model.addAttribute("allCheckbox", allCheckbox);
				//System.out.println(mc_nums);
				
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
	 public String createMenu(@PathVariable("a") int st_num, Model model) {
		 int mn_num = businessService.getMn_num();
		 List<OptionVO> option = optionService.getOption(mn_num);
		 MenuVO menu = menuService.getMenu(mn_num);

		 model.addAttribute("menu", menu);
		 model.addAttribute("option", option);

		 return "/business/realC";
	 }
	 
	 // 메뉴 삭제 Post
	 @PostMapping("/business/realC")
	 @ResponseBody
	 public String makeMenu(@RequestParam("st_num") String st_num) {
		 System.out.println(st_num);
		 boolean makeMenuMijung = businessService.makeMenuMijung(st_num);
		 int mn_num = businessService.getMijungMn_num();
		 boolean makeOptionMijung = businessService.makeOptionMijung(mn_num);
		 int os_num = businessService.getNewOs_Num();
		 boolean makeOptionValueMijung = businessService.makeOptionValueMijung(os_num);
		 
		 return "/business/realCRUD";
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
	 public String updateMenu(HttpSession session, @RequestParam("mn_num") String mn_num,
	         @RequestParam("mn_name") String mn_name, @RequestParam("mn_price") String mn_price, @RequestParam("mn_contents") String mn_contents,
	         @RequestParam("osNameList") String osNameList, @RequestParam("osNumList") String osNumList,
	         @RequestParam("ovNumList") String ovNumList, @RequestParam("optionValueList") String optionValueList, 
	         @RequestParam("optionPriceList") String optionPriceList) {
//		System.out.println(mn_num);
//		System.out.println(mn_name); 
//		System.out.println(mn_price); 
//		System.out.println(mn_contents); 
//		System.out.println(osNameList); 
//		System.out.println(optionValueList); 
//		System.out.println(optionPriceList);
//		System.out.println(osNumList);
//		System.out.println(ovNumList);
		
        // 문자열을 ','를 기준으로 나누어 리스트로 저장
        List<String> os_name = splitAndToList(osNameList);
        List<String> ov_value = splitAndToList(optionValueList);
        List<String> ov_price = splitAndToList(optionPriceList);
        List<String> os_num = splitAndToList(osNumList);
        List<String> ov_num = splitAndToList(ovNumList);

        // 각 리스트의 내용을 출력해보기
//        System.out.println("os_name: " + os_name);
//        System.out.println("ov_value: " + ov_value);
//        System.out.println("ov_price: " + ov_price);
//        System.out.println("os_num: " + os_num);
//        System.out.println("ov_num: " + ov_num);

		boolean updateMenu = businessService.updateMenu(mn_num, mn_name, mn_price, mn_contents);

	    // os_num을 기준으로 updateOption을 반복
	    for (int i = 0; i < os_num.size(); i++) {
	        // 해당 인덱스의 값을 가져와서 updateOption 호출
	        String os_name_for_index = os_name.get(i);

	        boolean updateOption = businessService.updateOption(os_num.get(i), os_name_for_index, mn_num);
	    }
	    // ov_num을 기준으로 updateOptionValue을 반복
	    for (int i = 0; i < ov_num.size(); i++) {
	    	// 해당 인덱스 값을 가져와서 updateOptionValue 호출
	    	String ov_value_for_index = ov_value.get(i);
	    	String ov_price_for_index = ov_price.get(i);
	    	
	    	boolean updateOptionValue = businessService.updateOptionValue(ov_num.get(i), ov_value_for_index, ov_price_for_index);
	    }

		 return "/business/realCRUD";
	 }

	 // 문자열을 ','를 기준으로 나누어 리스트로 저장하는 메소드
	 private static List<String> splitAndToList(String input) {
		 String[] array = input.split(",");
		 List<String> list = new ArrayList<String>();
		 for (String value : array) {
			 list.add(value);
		 }
		 return list;
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
	public String order(@PathVariable("a") int st_num, Model model) {
		model.addAttribute("st_num", st_num);
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
	
	/** 매장 등록 */
	@GetMapping("/business/plusinfo")
	public String plusInfo(HttpSession session, Model model) {
		// ManagerVO buser = managerService.getBMember();
		
		// 세션값을 불러오고 화면에 보내주기만 하면됨ㅇㅇ! 서비스한테 멤버정보 가져다달라고 일시킬 필요도 없음.
		ManagerVO buser = (ManagerVO)session.getAttribute("buser");
//		System.out.println(buser); // 1. 세션값이 있는지 확인하기 위에 sout!
		
		// 2. 화면
		model.addAttribute("buser", buser);
		return "/business/plusinfo";
	}
	
	// * edu 회원가입폼 제출 참고함.
	@PostMapping("/business/plusinfo")
	public String plusInfoPost(StoreVO store, MultipartFile[] files, Model model, HttpSession session) {
//		System.out.println(store); // 1. 내가 보내준 정보가 잘 넘어왔지 꼭! 먼저 확인! / 알려줘야하는지
		
		// 서비스에게 서버에 데이터 저장하라고 => 스토어 정보(+로그인한 아이디 buser에 있음)를 주면서 
		// => 여부..는 아니고 저기서 끝인가? -> (여부였음ㅇㅇ..)
		
		// 2. 일을 하려면 무엇이 필요한지
		// 3. 끝났을때 알고싶은 정보가 무엇인지 = 정보를 추가했는지 못했는지만 알면 됨. 
		ManagerVO buser = (ManagerVO)session.getAttribute("buser"); // 현재 로그인 중인 사업자 아이디가 storeDB에 필요함!!!
		boolean res = storeService.plusInfo(store, buser, files); // 추가했다 못했다만 알면됨 
			// -> 4. 수정UPDATE로 바꿔야됨. boolean은 냅둬도 되는지, 업데이트 여부만 알려주면 되는지 한번 확인해보자고
		
		if(res) {
			model.addAttribute("msg", "매장 정보를 추가했습니다!");
			model.addAttribute("url", "business/home");
		} else {
			model.addAttribute("msg", "정보를 수정하는데 실패했습니다.");
			model.addAttribute("url", "business/plusinfo");
		}
		
//		model.addAttribute("buser", buser);
//		model.addAttribute("plus", store);
		return "/main/message";
		
	}
}
