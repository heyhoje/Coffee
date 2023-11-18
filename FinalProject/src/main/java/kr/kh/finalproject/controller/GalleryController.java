package kr.kh.finalproject.controller;

import java.io.IOException;
import java.util.Arrays;
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
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RequestPart;
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
	public String galleryInsert(Model model, Integer gal_num,HttpSession session) {
		MemberVO user = (MemberVO)session.getAttribute("user");
		if(user == null) {
			Message msg = new Message("", "로그인이 필요합니다.");
			model.addAttribute("msg", msg);
			return "/main/message2";
		}
		model.addAttribute("gal_num", gal_num == null ? 0 : gal_num);
		return "/gallery/GalleryInsert";
	}
	
	
	@PostMapping("/gallery/GalleryInsert")
	public String galleryInsertPost(GalleryVO gallery, HttpSession session, Model model, @RequestParam("file2") MultipartFile[] files2) {
		MemberVO user = (MemberVO)session.getAttribute("user");
		Message msg;
		if(galleryService.insertGallery(gallery, user, files2)) {
			msg = new Message("/gallery/GalleryList", "게시글을 등록했습니다.");
		}else {
			msg = new Message("/gallery/GalleryList", "게시글을 등록하지 못했습니다.");
		}
		model.addAttribute("msg", msg);
		return "/main/message2";
	}
	@GetMapping("/gallery/GalleryDetail")
	public String galleryDetail(Model model, Integer gal_num , Criteria cri, HttpSession session) {
		galleryService.updatehits(gal_num);
		GalleryVO gallery = galleryService.getGallery(gal_num);
		MemberVO user = (MemberVO) session.getAttribute("user");
		
		model.addAttribute("gallery", gallery);
		model.addAttribute("cri", cri);

		return "/gallery/GalleryDetail";
	}
	
	@GetMapping("/gallery/galleryUpdate")
	public String galleryUpdate(Model model,Integer gal_num, HttpSession session) {
		GalleryVO gallery = galleryService.getGallery(gal_num);
		MemberVO user = (MemberVO)session.getAttribute("user");
		if(user.getMe_user_id().equals(gallery.getGal_me_user_id()) || user.getMe_authority().equals("ADMIN")) {
			model.addAttribute("gallery", gallery);
			return "/gallery/galleryUpdate";
		}
	
		if(user == null || gallery == null || !user.getMe_user_id().equals(gallery.getGal_me_user_id()) || !user.getMe_authority().equals("ADMIN")) {
			Message msg = new Message("board/boardList", "잘못된 접근입니다.");
			model.addAttribute("msg", msg);
			return "/main/message2";
		}
		model.addAttribute("gallery", gallery);
		return "/gallery/galleryUpdate";
	}
	@PostMapping("/gallery/galleryUpdate")
	public String galleryUpdatePost(Model model, GalleryVO gallery, 
			MultipartFile[] files, Integer[] delFiles, HttpSession session) {
		Message msg;
		MemberVO user = (MemberVO)session.getAttribute("user");
		if(galleryService.updateGallery(gallery, files, delFiles,user)) {
			msg = new Message("/gallery/GalleryDetail?gal_num="+gallery.getGal_num(), "게시글을 수정했습니다.");
		}else {
			msg = new Message("/gallery/GalleryUpdate?gal_num="+gallery.getGal_num(), "게시글을 수정하지 못했습니다."); 
		}
		model.addAttribute("msg", msg);
		return "/main/message2";
	}
	@GetMapping("/gallery/galleryDelete")
	public String galleryDelete(Model model, HttpSession session, Integer gal_num) {
		MemberVO user = (MemberVO)session.getAttribute("user");
		Message msg;
		if(galleryService.deleteBoard(gal_num, user)) {
			msg = new Message("/gallery/galleryList", "게시글을 삭제했습니다.");
		}else {
			msg = new Message("/gallery/galleryList", "잘못된 접근입니다.");
		}
		model.addAttribute("msg", msg);
		return "/main/message2";
	}
}
	

