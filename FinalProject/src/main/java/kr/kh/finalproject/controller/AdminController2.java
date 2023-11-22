package kr.kh.finalproject.controller;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.kh.finalproject.service.AdvertisementService;
import kr.kh.finalproject.service.ManagerService;
import kr.kh.finalproject.service.ReviewService;
import kr.kh.finalproject.service.StoreService;
import kr.kh.finalproject.vo.AdvertisementVO;
import kr.kh.finalproject.vo.ManagerVO;
import kr.kh.finalproject.vo.MemberVO;
import kr.kh.finalproject.vo.ReviewVO;
import kr.kh.finalproject.vo.StoreVO;

@Controller
public class AdminController2 {

	@Autowired
	ManagerService managerService;
	@Autowired
	StoreService storeService;
	@Autowired
	AdvertisementService advertisementService;
	@Autowired
	ReviewService reviewService;
	
	@GetMapping("/admin/home")
	public String adminPage(Model model, MemberVO member) {
//		cri.setPerPageNum(5);
//		List<ManagerVO> managerList = managerService.getManagerList(manager, cri);
//		int totalCount = managerService.getTotalCount(manager, cri);
//		PageMaker pm = new PageMaker(2, cri, totalCount);
		MemberVO user = new MemberVO();
        
		model.addAttribute("user", user);
//		model.addAttribute("pm", pm);
//		model.addAttribute("manager", managerList);
		return "/admin/home";
	}
	
	/** 사업자 회원가입 승인 */
	@GetMapping("/admin/bmember")
	public String adminBMember(Model model) {
		// 회원가입 승인여부가 '0'인 사업자회원 리스트 가져와
		List<ManagerVO> bmList = managerService.getBMemberList(0);	
		System.out.println(bmList);
		
		// 화면
		model.addAttribute("bmList", bmList);
		return "/admin/bmember";
	}
	
	// ajax - post 승인/거절 버튼 기능
	// json으로 받으면 Map<String, Object> map / 어노테이션 @ResponseBody추가 // 매개변수 @RequestBody추가
	@ResponseBody
	@PostMapping("/admin/bmember")
	public Map<String, Object> bmemberPost(@RequestBody ManagerVO manager){
		Map<String, Object> map = new HashMap<String, Object>();
		System.out.println(manager);
		
		//ManagerVO bmember = new ManagerVO();
		boolean res = managerService.updateManager(manager); // 승인 -> 업데이트 -> bm_approval( 0 -> 1 )
		// 동시에 getMakeStore 를 하면서 st_num을 만들고, bm_id값만 넘겨주고, st_approval default값 0이 주어짐 -> storeVO 데이터 저장! 
		StoreVO store = storeService.makeStore(manager); // 상점등록 - (st_num) st_bm_id를 이용해서 insert
		
		// => 매장등록 (plusinfo) insert -> update 로 변경. 
		
		// map.put("store", store); // 화면단에 store정보를 보낼 필요는 없음. 그냥 일만하러 왔다.
		map.put("res", res);
		return map;
		
	}
	
	
	/** 사업자 매장등록 승인 */
	@GetMapping("/admin/bstore")
	public String adminBStore(Model model) {
		// 매장등록 승인여부가 '0'인 매장 리스트 가져와
		List<StoreVO> bsList = storeService.getBstoreList(0);	
		System.out.println(bsList);
		
		/* 이 부분은 Controller가 아니라 StoreVO에서 getter설정 해야한다!!!!
		 * // 시간정보 HH:mm 으로 화면에 보내기 위해 코드 추가 // 예시로 사용할 영업 시간 데이터 Date st_opentime = new
		 * Date(); // 영업 시작 시간 Date st_closetime = new Date(); // 영업 종료 시간
		 * 
		 * // 시간 형식을 "HH:mm"으로 지정 SimpleDateFormat sdf = new SimpleDateFormat("HH:mm");
		 * 
		 * // 각각의 시간을 형식화 String formattedOpenTime = sdf.format(st_opentime); String
		 * formattedCloseTime = sdf.format(st_closetime);
		 * 
		 * 
		 * // 각각의 시간을 형식화하여 모델에 추가 model.addAttribute("formattedOpenTime", sdf.format(st_opentime)); 
		 * model.addAttribute("formattedCloseTime", sdf.format(st_closetime));
		 */
        
		// 화면
		model.addAttribute("bsList", bsList);
		return "/admin/bstore";
	}
	
	/*
	 * // ajax - post 승인/거절 버튼 기능
	 * 
	 * @ResponseBody
	 * 
	 * @PostMapping("/admin/bstore") public Map<String, Object>
	 * bstorePost(@RequestBody StoreVO store){ Map<String, Object> map = new
	 * HashMap<String, Object>();
	 * 
	 * // boolean res = storeService.updateStore(store);
	 * 
	 * // map.put("res", res); return map; }
	 */
	
	
	/** 광고&프로모션 승인 */
	@GetMapping("/admin/ad")
	public String adminAdvertisement(Model model) {
		// 프로모션 승인여부가 '0'인 광고&프로모션 리스트 가져와
		List<AdvertisementVO> adList = advertisementService.getAdList(0);
		System.out.println(adList);
		
		// 화면
		model.addAttribute("adList", adList);
		return "/admin/ad";
	}
	
	// ajax - post 승인/거절 버튼 기능
		@ResponseBody
		@PostMapping("/admin/ad")
		public Map<String, Object> advertisementPost(@RequestBody AdvertisementVO ad){
			Map<String, Object> map = new HashMap<String, Object>();
			
			boolean res = advertisementService.updateAd(ad);
			
			map.put("res", res);
			return map;
		}
	
	
	
	/** 리뷰 등 기타 승인 
	 *  전체 리뷰 리스트를 가져오니까 매개변수 보낼 필요 없겠지? */
	@GetMapping("/admin/review")
	public String adminReview(Model model) {
		List<ReviewVO> reList = reviewService.getReviewList();
		
		model.addAttribute("reList", reList);
		return "/admin/review";
	}
	
	// ajax - post 삭제 버튼 기능
	@ResponseBody
	@PostMapping("/admin/review")
	public Map<String, Object> deleteReview(@RequestBody ReviewVO review){
		Map<String, Object> map = new HashMap<String, Object>();
		
		boolean res = reviewService.deleteReview(review);
		
		map.put("res", res);
		return map;
	}
}
