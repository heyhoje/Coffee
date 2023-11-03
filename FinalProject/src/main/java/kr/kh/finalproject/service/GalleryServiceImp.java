package kr.kh.finalproject.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import kr.kh.finalproject.dao.GalleryDAO;
import kr.kh.finalproject.pagination.Criteria;
import kr.kh.finalproject.util.uploadFileUtils;
import kr.kh.finalproject.vo.FileVO;
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
		return galleryDao.selectCountGalleryList(cri);
	}
	
	@Override
	public boolean insertCoffee(GalleryVO gallery, MemberVO user, MultipartFile[] fileList) {
		if(gallery == null || 
				gallery.getGal_title() == null) {
				return false;
			}
			//작성자가 없으면 안되기 때문
			if(user == null) {
				return false;
			}
			//게시글 작성자를 로그인한 회원 아이디로 수정
			gallery.setGal_me_user_id(user.getMe_user_id());
			//게시글을 DB에 저장
			boolean res = galleryDao.insertCoffeeBoard(gallery);
			
			if(!res) {
				return false;
			}
			//첨부파일 등록
			if(fileList == null || fileList.length == 0) {
				return true;
			}
			
			for(MultipartFile file : fileList) {
				if(file == null || file.getOriginalFilename().length() == 0) {
					continue;
				}
				try {
					//원래 파일명
					String fi_ori_name = file.getOriginalFilename();
					//서버에 업로드 후 업로드된 경로와 uuid가 포함된 파일명
					String fi_name = uploadFileUtils.uploadFile(uploadPath, fi_ori_name, file.getBytes());
					//파일 객체
					FileVO fileVo = new FileVO(gallery.getGal_num(), fi_name, fi_ori_name);
					galleryDao.insertFile(fileVo);
				}catch(Exception e) {
					e.printStackTrace();
				}
			}
			
			return true;
		}
}
