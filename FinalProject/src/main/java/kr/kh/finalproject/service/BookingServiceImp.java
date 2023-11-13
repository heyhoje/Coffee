package kr.kh.finalproject.service;

import java.time.format.DateTimeFormatter;

import org.springframework.stereotype.Service;

@Service
public class BookingServiceImp implements BookingService{
	private static final DateTimeFormatter DATE_FORMATTER_TO_DAY = DateTimeFormatter.ofPattern("yyyy-MM-dd");
	private static final int RANDOM_PLUS_DAY = 5;
	@Override
	public String getRandomReservationDate() {
		return null;
	}		
	
}
