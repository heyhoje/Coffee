package kr.kh.finalproject.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import kr.kh.finalproject.pagination.Criteria;
import kr.kh.finalproject.pagination.PageMaker;
import kr.kh.finalproject.service.MeetingroomService;
import kr.kh.finalproject.vo.MeetingroomVO;
import kr.kh.finalproject.vo.MemberVO;
import kr.kh.finalproject.vo.ReservationVO;
import kr.kh.finalproject.vo.RoomBasketVO;

@Controller
public class MeetingroomController {

	@Autowired
	MeetingroomService meetingroomService;

	/** 예약홈 - 미팅룸정보, 예약시간정보, 페이지네이션 */
	@GetMapping("/meetingroom/home")
	public String meetingroomList(Model model, Criteria cri) {
		cri.setPerPageNum(5);
		List<MeetingroomVO> mrList = meetingroomService.getMrList(cri);
		List<ReservationVO> rsList = meetingroomService.getRsList(cri);

		int totalCount = meetingroomService.getTotalCount(cri);
		PageMaker pm = new PageMaker(2, cri, totalCount);

		model.addAttribute("pm", pm);
		model.addAttribute("mrList", mrList);
		model.addAttribute("rsList", rsList);
//		System.out.println(mrList);
//		System.out.println(rsList);
		return "/meetingroom/home";
		
	}

	@PostMapping("/meetingroom/booking")
	public String roomBookingPost(MeetingroomVO meeting, Model model, HttpSession session) {
		// 1. 로그인한 회원 정보를 가져온다 / 끝. 미팅룸vo를 화면에 뿌려준다.
		MemberVO user = (MemberVO) session.getAttribute("user");
		String id = user.getMe_user_id();
//		System.out.println(id);
//		System.out.println(user);
//		System.out.println(meeting);

		model.addAttribute("meeting", meeting);

		 // 2. 미팅룸에 있는? 예약홈에서 선택한 정보값들을 int, int[]로 생성한다? 
		int room_num = meeting.getRoom_num(); 
		int room_st_num = meeting.getRoom_st_num(); 
		int arrStart[] = meeting.getArr_room_starttime();
//		System.out.println("room_num : " + room_num);
//		System.out.println("room_st_num : " + room_st_num);
//		for(int i = 0; i < arrStart.length; i++) {
//			System.out.println(arrStart[i]);
//		}
		
		// 반복문 이용해서 arrStart.length만큼 insert 반복
		for(int i = 0; i < arrStart.length; i++) {
			boolean insertRBasket = meetingroomService.insertRBasket(room_num, id, arrStart[i]);
		}
		
		
		// 3. 예약 장바구니 DB Insert - 서비스에서 해당 작업 하면 안된다했지만 시간이 촉박하여 컨트롤러에서 쭈루룩 작업해버림. //
			// param : room_st_num, room_num, arr_room_starttime (필요한 변수들 - 매장, 룸, 선택한시간대)
		 	// arrStart[i]을 인트로 담고, RoomBasketVO에 미팅룸에서 받은 값들을 세팅값으로 넣어준다. 
		
//		RoomBasketVO roomBasket = new RoomBasketVO();
//		for (int i = 0; i < arrStart.length; i++) { 
//			int start = arrStart[i];
//			roomBasket.setRs_room_num(room_num); 
//			roomBasket.setRs_room_st_num(room_st_num);
//			roomBasket.setRs_room_starttime(start);
//		}
//		System.out.println("roomBasket: " + roomBasket);

		 // 서비스한테 장바구니 정보를 전달하면서 RoomBasket DB에 저장하라고 한다. => 결제 완료 시, reservation 으로 넘어가는 것.
		 // boolean res = meetingroomService.addToRoomBasket(roomBasket); }
		 
		// 2. 해당 사용 자 장바구니 정보 조회

		// 3. 조회 한 정보 return

		return "/meetingroom/booking";

	}
	
	
	/** 예약홈 - 미팅룸정보, 예약시간정보, 페이지네이션 */
	@GetMapping("/meetingroom/booking")
	public String meetingroomBaguni(HttpSession session, Model model) {
		MemberVO user = (MemberVO) session.getAttribute("user");
		String id = user.getMe_user_id();
		List<RoomBasketVO> rBasketList = meetingroomService.rBasketList(id);
//		System.out.println(rBasketList);
		
		
		model.addAttribute("rBasketList", rBasketList);
		return "/meetingroom/booking";		
	}
	
	@PostMapping("/meetingroom/bookingend")
	public String bookingEndPost(HttpSession session, @RequestParam("rs_start") String rs_start, @RequestParam("rs_room_num") String rs_room_num) {
		MemberVO user = (MemberVO) session.getAttribute("user");
		String id = user.getMe_user_id();
//		System.out.println(rs_start);
//		System.out.println(rs_room_num);
		List<String> rs_startList = splitAndToList(rs_start);
		List<String> rs_room_numList = splitAndToList(rs_room_num);

		for(int i = 0; i < rs_startList.size(); i++) {
			boolean insertRV = meetingroomService.insertRV(id, rs_startList.get(i), rs_room_numList.get(i));
		}
		boolean killBaguni = meetingroomService.killBaguni(id);
		
		return "";
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
	
	
	

}