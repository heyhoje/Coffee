package kr.kh.finalproject.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping(value="/gallery/*")
public class GalleryController {
	
	@GetMapping(value="coffee")
	public String coffee() {
		
		return "/gallery/coffee";
	}
	@GetMapping(value="noncoffee")
	public String noncoffee() {
		
		return "/gallery/noncoffee";
	}
	@GetMapping(value="beverages")
	public String beverages() {
		
		return "/gallery/beverages";
	}
	@GetMapping(value="food")
	public String food() {
		
		return "/gallery/food";
	}
	@GetMapping(value="cafestore")
	public String cafestore() {
		
		return "/gallery/cafestore";
	}
	
}
