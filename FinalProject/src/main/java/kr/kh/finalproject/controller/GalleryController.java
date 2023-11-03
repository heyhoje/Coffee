package kr.kh.finalproject.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;

import kr.kh.finalproject.service.GalleryService;
import kr.kh.finalproject.vo.GalleryVO;
import kr.kh.finalproject.vo.MemberVO;

@Controller
@RequestMapping(value="/gallery/*")
public class GalleryController {
	
	@Autowired
	GalleryService galleryService;
	
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
	
	@GetMapping("insert")
	public String insert() {
		return "/gallery/insert";
	}
	@PostMapping("insert")
	public String insertCoffeePost(Model model, GalleryVO gallery, HttpSession session, 
			MultipartFile [] fileList) {
		System.out.println(gallery);
		MemberVO user = (MemberVO)session.getAttribute("user");
		boolean res = galleryService.insertCoffee(gallery, user, fileList);
		if(res) {
			model.addAttribute("msg", "게시글 등록 성공!");
			model.addAttribute("url", "gallery/coffee");
		}else {
			model.addAttribute("msg", "게시글 등록 실패!");
			model.addAttribute("url", "gallery/insert");
		}
		return "/main/message";
	}
}
