package kr.kh.finalproject.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import kr.kh.finalproject.service.BookingService;

@Controller
@RequestMapping("/booking")
public class BookingController {
	@Autowired
	BookingService bookingservice;
	
	
	
	@GetMapping
	public String showBooking(@RequestParam int id, Model model) {
		String reservationDate = bookingservice.getRandomReservationDate();
		model.addAttribute("reservationDateTime",reservationDate);
		return reservationDate;
	}
}
