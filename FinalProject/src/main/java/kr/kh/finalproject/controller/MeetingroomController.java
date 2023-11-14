package kr.kh.finalproject.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import kr.kh.finalproject.pagination.Criteria;
import kr.kh.finalproject.pagination.PageMaker;
import kr.kh.finalproject.service.MeetingroomService;
import kr.kh.finalproject.vo.MeetingroomVO;
import kr.kh.finalproject.vo.MemberVO;
import kr.kh.finalproject.vo.ReservationVO;

@Controller
public class MeetingroomController {
	
	@Autowired
	MeetingroomService meetingroomService;
		

	
	@GetMapping("/meetingroom/home")
	public String meetingroomList(Model model, Criteria cri) {
		cri.setPerPageNum(5);
		List<MeetingroomVO> meetingroomList = meetingroomService.getMeetingroomList(cri);
		List<ReservationVO> reservationList = meetingroomService.getReservationList(cri);
		int totalCount = meetingroomService.getTotalCount(cri);
		PageMaker pm = new PageMaker(2, cri, totalCount);
		model.addAttribute("pm", pm);	
		model.addAttribute("meetingroomList", meetingroomList);
		model.addAttribute("reservationList", reservationList);
		return "/meetingroom/home";
		
	
	}	
	@RequestMapping(value="/meetingroom/booking", method=RequestMethod.GET)
	public String booking() {
		
		return "/meetingroom/booking";
	}
	
		

	}
		
	

	
