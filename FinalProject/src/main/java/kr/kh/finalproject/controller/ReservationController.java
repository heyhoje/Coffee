package kr.kh.finalproject.controller;

import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import kr.kh.finalproject.service.ReservationService;
import kr.kh.finalproject.vo.ReservationVO;

public class ReservationController {

	@Autowired
	private ReservationService reservationService;

	@RequestMapping("/rsadd")
	public String makeReservation(Model model, HttpServletRequest request, HttpServletResponse response) {
		String numberOfPeople = request.getParameter("numberOfPeople");
		String reservationDate = request.getParameter("reservationDate");
		String rsRoomNum = request.getParameter("rsRoomNum");
		String selectedTimes = request.getParameter("selectedTimes");

		ReservationVO reservation = new ReservationVO();

		reservation.setRs_people(numberOfPeople);
		reservation.setRs_room_num(rsRoomNum);
		reservation.setRs_date(reservationDate);
		reservation.setRs_start(selectedTimes);

		reservationService.save(reservation); // 데이터베이스에 예약 정보 저장
		System.out.println(reservation);
		model.addAttribute("msg", "ㅎㅎ");
		return "/main/message";
	}
}
