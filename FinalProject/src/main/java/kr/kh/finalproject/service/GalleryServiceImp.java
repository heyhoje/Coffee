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
	public boolean insertGallery(GalleryVO gallery, MemberVO user, MultipartFile[] files2) {
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
		if(files2 == null || files2.length == 0) {
			return true;
		}
				
		uploadFileAndInsert(files2, gallery.getGal_num());
				
		return true;
	}

	private void uploadFileAndInsert(MultipartFile[] files2, int fi_gal_num) {
		if(files2 == null || files2.length == 0) {
			return;
		}
		for(MultipartFile file : files2) {
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

	@Override
	public void updatehits(Integer gal_num) {
		if(gal_num == null) {
			return;
		}
		galleryDao.updateGalleryhits(gal_num);
	}

	@Override
	public GalleryVO getGallery(Integer gal_num) {
		if(gal_num == null) {
			return null;
		}
		return galleryDao.selectGallery(gal_num);
	}

	@Override
	public boolean updateGallery(GalleryVO gallery, MultipartFile[] files, Integer[] delFiles, MemberVO user) {
		if(gallery == null || gallery.getGal_title()==null || gallery.getGal_title().length() == 0 ) {
			return false;
				}
		//�������Խñ� ������ ������(�α����� ȸ���� �ۼ��ڰ� ������ Ȯ���� ����) 
		GalleryVO dbGallery = galleryDao.selectGallery(gallery.getGal_num());
		//db�� �ش� �Խñ��� ���ų� �������Խñ� �ۼ��ڿ� �α����� ȸ���� �ٸ� ���
		if(dbGallery == null)
		{
			return false;
		}
		if(!dbGallery.getGal_me_user_id().equals(user.getMe_user_id()) && !user.getMe_authority().equals("ADMIN")) {
			return false;
		}
		
		if(!galleryDao.updateGallery(gallery)) {
			return false;
		}
		//÷������ ������Ʈ 
		//�߰��� ÷�������� ������ ���ε� �� DB�� �߰�
		uploadFileAndInsert(files,gallery.getGal_num());
		
		//������ ÷�������� �������� ���� �� DB���� ����
		deleteFile(delFiles);
		return true;
	}

	private void deleteFile(Integer[] delFiles) {
		if(delFiles == null || delFiles.length == 0) {
			return;
		}
		
		for(Integer num : delFiles) {
			if(num == null) {
				continue;
			}
			//÷������ ������ ������
			FileVO fileVo = galleryDao.selectFile(num);
			if(fileVo == null) {
				continue;
			}
			uploadFileUtils.deleteFile(uploadPath, fileVo.getFi_name());
			//DB���� ���� 
			galleryDao.deleteFile(num);
				}
	}

	@Override
	public boolean deleteBoard(Integer gal_num, MemberVO user) {
		if(gal_num == null || user == null) {
			return false;
		}
		GalleryVO gallery = galleryDao.selectGallery(gal_num);
		//���� �Խñ��̰ų� �ۼ��ڰ� �ƴϸ� 
		if(gallery == null){
			return false;
		}
		if(!gallery.getGal_me_user_id().equals(user.getMe_user_id()) && !user.getMe_authority().equals("ADMIN")) {
			return false;
		}
		//÷������ ����
		List<FileVO> fileList = gallery.getFileVoList();
		deleteFile(fileList);
		//�Խñ� ���� 
		galleryDao.deleteGallery(gal_num);
		return true;
			}

	private void deleteFile(List<FileVO> fileList) {
		if(fileList == null || fileList.size() == 0) {
			return;
		}
		
		Integer [] nums = new Integer[fileList.size()];
		for(int i = 0; i<nums.length; i++) {
			nums[i] = fileList.get(i).getFi_num();
		}
		deleteFile(nums);
	}


			
	
	
}		
