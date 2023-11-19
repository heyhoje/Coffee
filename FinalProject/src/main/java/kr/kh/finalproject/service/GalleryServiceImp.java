package kr.kh.finalproject.service;

import java.io.IOException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import kr.kh.finalproject.dao.GalleryDAO;
import kr.kh.finalproject.pagination.Criteria;
import kr.kh.finalproject.util.uploadFileUtils;
import kr.kh.finalproject.vo.FileVO;
import kr.kh.finalproject.vo.GalleryTypeVO;
import kr.kh.finalproject.vo.GalleryVO;
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

	@Override
	public boolean insertGallery(GalleryVO gallery, MemberVO user, MultipartFile[] files) {
		if(user == null || user.getMe_user_id() == null) {
			return false;
		}
		if(gallery == null || gallery.getGal_title()== null || gallery.getGal_title().length() == 0) {
			return false;
		}
		gallery.setGal_me_user_id(user.getMe_user_id());
		if(!galleryDao.insertGallery(gallery)) {
			return false;
		}
		if(files == null || files.length == 0) {
			return true;
		}
				
		uploadFileAndInsert(files, gallery.getGal_num());
				
		return true;
	}

	private void uploadFileAndInsert(MultipartFile[] files, int fi_gal_num) {
		if(files == null || files.length == 0) {
			return;
		}
		for(MultipartFile file : files) {
			if(file == null || file.getOriginalFilename().length() == 0) {
				continue;
			}
			try {
				String fi_name = uploadFileUtils.uploadFile(uploadPath, file.getOriginalFilename(), file.getBytes());
				FileVO fileVo = new FileVO(fi_gal_num, fi_name, file.getOriginalFilename());
				galleryDao.insertFile(fileVo);
			} catch (IOException e) {
				e.printStackTrace();
			}
			
		}
	}

			
	
}
