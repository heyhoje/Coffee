package kr.kh.finalproject.service;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import kr.kh.finalproject.pagination.Criteria;
import kr.kh.finalproject.vo.GalleryVO;
import kr.kh.finalproject.vo.MemberVO;

public interface GalleryService {

	boolean insertCoffee(GalleryVO gallery, MemberVO user, MultipartFile[] fileList);

	int getTotalCount(Criteria cri);

	List<GalleryVO> getGalleryList(Criteria cri);


}
