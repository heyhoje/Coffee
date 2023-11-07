package kr.kh.finalproject.service;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import kr.kh.finalproject.pagination.Criteria;
import kr.kh.finalproject.vo.GalleryTypeVO;
import kr.kh.finalproject.vo.GalleryVO;
import kr.kh.finalproject.vo.MemberVO;

public interface GalleryService {

	List<GalleryVO> getGalleryList(Criteria cri);

	int getTotalCount(Criteria cri);

	List<GalleryTypeVO> getGalleryTypeList();


}

	

	


