package kr.kh.finalproject.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

<<<<<<< HEAD
=======
/**
 * Handles requests for the application home page.
 */
>>>>>>> main
@Controller
public class HomeController {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
<<<<<<< HEAD
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String write(HttpSession session, HttpServletRequest request) throws Exception {
	
		return "/index";
=======
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String write(HttpSession session, HttpServletRequest request) throws Exception {
	
		return "/main/index";
>>>>>>> main
	}
	
}
