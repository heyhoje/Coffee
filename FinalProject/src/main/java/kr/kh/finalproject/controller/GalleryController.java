package kr.kh.finalproject.controller;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
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
import kr.kh.finalproject.vo.GalleryTypeVO;
import kr.kh.finalproject.vo.GalleryVO;
import kr.kh.finalproject.vo.MemberVO;
@Controller
public class GalleryController {
	
	
	@Autowired
	GalleryService galleryService;
	
	@RequestMapping(value = "/main/gallery", method = RequestMethod.GET)
	public String galleryMain(HttpSession session, HttpServletRequest request) throws Exception {
	
		return "/main/gallery";
	}
	
	@GetMapping("/gallery/GalleryList")
	public String galleryList(Model model, Criteria cri) {
		cri.setPerPageNum(5);
		List<GalleryVO> list = galleryService.getGalleryList(cri);
		int totalCount = galleryService.getTotalCount(cri);
		PageMaker pm = new PageMaker(2, cri, totalCount);
		
		List<GalleryTypeVO> typeList = galleryService.getGalleryTypeList();
		
		model.addAttribute("pm", pm);
		model.addAttribute("list", list);
		return "/gallery/GalleryList";
		}
	
	@GetMapping("/gallery/GalleryInsert")
	public String boardInsert(Model model, Integer gal_num,HttpSession session) {
		MemberVO user = (MemberVO)session.getAttribute("user");
		if(user == null) {
			model.addAttribute("msg", "로그인이 필요합니다.");
			return "/main/message";
		}
		model.addAttribute("gal_num", gal_num == null ? 0 : gal_num);
		return "/gallery/GalleryInsert";
	}
	
	@PostMapping("/gallery/galleryInsert")
	public String boardInsertPost(GalleryVO gallery, HttpSession session, Model model, MultipartFile[] files) {
		MemberVO user = (MemberVO)session.getAttribute("user");
		if(galleryService.insertGallery(gallery, user, files)) {
			model.addAttribute("msg", "게시글을 등록하였습니다.");
		}else {
			model.addAttribute("msg", "게시글을 등록하지 못했습니다.");
		}
		return "/main/message";
	}
}
	
