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
		
		boolean insertGallery(GalleryVO gallery, MemberVO user, MultipartFile[] files2);
		
		void updatehits(Integer gal_num);
		
		GalleryVO getGallery(Integer gal_num);
		
		boolean updateGallery(GalleryVO gallery, MultipartFile[] files, Integer[] delFiles, MemberVO user);
		
		boolean deleteBoard(Integer gal_num, MemberVO user);
		
}
