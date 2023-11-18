package kr.kh.finalproject.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

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
		return "/meetingroom/home";

	}

	@PostMapping("/meetingroom/booking")
	public String roomBooking(MeetingroomVO meeting, Model model, HttpSession session) {
		
		
		
		return "/meetingroom/booking";
		
	}

}