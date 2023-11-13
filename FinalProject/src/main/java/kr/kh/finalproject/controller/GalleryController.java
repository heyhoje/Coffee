package kr.kh.finalproject.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;

import kr.kh.finalproject.pagination.Criteria;
import kr.kh.finalproject.pagination.PageMaker;
import kr.kh.finalproject.service.GalleryService;
import kr.kh.finalproject.util.Message;
import kr.kh.finalproject.vo.GalleryTypeVO;
import kr.kh.finalproject.vo.GalleryVO;
import kr.kh.finalproject.vo.MemberVO;

@Controller
public class GalleryController {
	
	
	@Autowired
	GalleryService galleryService;
	
	
	@GetMapping("/gallery/GalleryList")
	public String galleryList(Model model, Criteria cri) {
		cri.setPerPageNum(6);
		List<GalleryVO> list = galleryService.getGalleryList(cri);
		int totalCount = galleryService.getTotalCount(cri);
		PageMaker pm = new PageMaker(2, cri, totalCount);
		
		List<GalleryTypeVO> typeList = galleryService.getGalleryTypeList();
		
		model.addAttribute("pm",pm);
		model.addAttribute("list",list);
		return "/gallery/GalleryList";
	}
	
	
	
}
