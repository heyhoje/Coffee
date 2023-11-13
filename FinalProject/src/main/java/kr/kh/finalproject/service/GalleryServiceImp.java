package kr.kh.finalproject.service;

import java.io.IOException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import kr.kh.finalproject.dao.GalleryDAO;
import kr.kh.finalproject.pagination.Criteria;
import kr.kh.finalproject.util.uploadFileUtils;
import kr.kh.finalproject.vo.GalleryTypeVO;
import kr.kh.finalproject.vo.GalleryVO;
import kr.kh.finalproject.vo.ImageVO;
import kr.kh.finalproject.vo.MemberVO;

@Service
public class GalleryServiceImp implements GalleryService{
	
	@Autowired
	GalleryDAO galleryDao;
	String uploadPath = "D:\\uploadfiles";

	@Override
	public List<GalleryVO> getGalleryList(Criteria cri) {
		if(cri == null) {
			cri = new Criteria();
		}
		return galleryDao.selectGalleryList(cri);
	}

	@Override
	public int getTotalCount(Criteria cri) {
		if(cri == null) {
			cri = new Criteria();
		}
		return galleryDao.selectGalleryCount(cri);
	}

	@Override
	public List<GalleryTypeVO> getGalleryTypeList() {
		return galleryDao.selectGalleryTypeList();
	}
	
	
}		
