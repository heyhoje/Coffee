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

import kr.kh.finalproject.pagination.Criteria;
import kr.kh.finalproject.pagination.PageMaker;
import kr.kh.finalproject.service.BusinessService;
import kr.kh.finalproject.service.ManagerService;
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
	
	@Autowired

	private BusinessService businessService;
	
	/** 매장등록( bmember + bstore ) */ 
	@Autowired
	private ManagerService managerService;
	@Autowired
	private StoreService storeService;

	/** 메뉴/옵션 */
	private MenuService menuService;
	@Autowired
	private OptionService optionService;


	// 사업자페이지 [홈]
	@RequestMapping(value = "/business/home/{a}", method = RequestMethod.GET)
	public String businesspage(@PathVariable("a") int st_num) {

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
		
		// 화면에 보여줄 데이터
		model.addAttribute("menu", menu);
		model.addAttribute("option", option);

		return "/business/realCRUD";
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
	
	/** 매장 등록 */
	@GetMapping("/business/plusinfo")
	public String plusInfo(HttpSession session, Model model) {
		// ManagerVO buser = managerService.getBMember();
		
		// 세션값을 불러오고 화면에 보내주기만 하면됨ㅇㅇ! 서비스한테 멤버정보 가져다달라고 일시킬 필요도 없음.
		ManagerVO buser = (ManagerVO)session.getAttribute("buser");
		System.out.println(buser); // 1. 세션값이 있는지 확인하기 위에 sout!
		
		// 2. 화면
		model.addAttribute("buser", buser);
		return "/business/plusinfo";
	}
	
	// * edu 회원가입폼 제출 참고함.
	@PostMapping("/business/plusinfo")
	public String plusInfoPost(StoreVO store, Model model, HttpSession session) {
		System.out.println(store); // 1. 내가 보내준 정보가 잘 넘어왔지 꼭! 먼저 확인! / 알려줘야하는지
		
		// 서비스에게 서버에 데이터 저장하라고 => 스토어 정보(+로그인한 아이디 buser에 있음)를 주면서 
		// => 여부..는 아니고 저기서 끝인가? -> (여부였음ㅇㅇ..)
		
		// 2. 일을 하려면 무엇이 필요한지
		// 3. 끝났을때 알고싶은 정보가 무엇인지 = 정보를 추가했는지 못했는지만 알면 됨. 
		ManagerVO buser = (ManagerVO)session.getAttribute("buser"); // 현재 로그인 중인 사업자 아이디가 storeDB에 필요함!!!
		boolean res = storeService.plusInfo(store, buser); // 추가했다 못했다만 알면됨.
		
		if(res) {
			model.addAttribute("msg", "매장등록이 신청되었습니다! 승인확인까지 기다려주세요.");
			model.addAttribute("url", "business/home");
		} else {
			model.addAttribute("msg", "매장등록에 실패했습니다. 입력해야할 정보를 모두 입력하였는지 확인해주세요.");
			model.addAttribute("url", "business/plusinfo");
		}
		
//		model.addAttribute("buser", buser);
//		model.addAttribute("plus", store);
		return "/main/message";
		
	}
}
