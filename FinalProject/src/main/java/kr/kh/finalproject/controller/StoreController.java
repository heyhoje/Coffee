package kr.kh.finalproject.controller;


	
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class StoreController {
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	
	@RequestMapping(value="/order/store", method=RequestMethod.GET)
	public String store() {
		
		return "/order/store";
	}
		
	@RequestMapping(value="/order/store2", method=RequestMethod.GET)
	public String store2() {
		
		return "/order/store2";
	}
	
}