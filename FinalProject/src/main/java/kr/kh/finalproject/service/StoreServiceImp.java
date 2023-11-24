package kr.kh.finalproject.service;

import java.io.IOException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import kr.kh.finalproject.dao.StoreDAO;
import kr.kh.finalproject.util.uploadFileUtils;
import kr.kh.finalproject.vo.ImageVO;
import kr.kh.finalproject.vo.ManagerVO;
import kr.kh.finalproject.vo.StoreVO;

@Service
public class StoreServiceImp implements StoreService{

	@Autowired
	StoreDAO storeDao;
	
	String uploadPath = "D:\\uploadfiles";

	/** 사이트 관리자 페이지 */
	@Override
	public List<StoreVO> getBstoreList(int st_approval) {

		return storeDao.selectBsList(st_approval);
	}

//	/** 매장등록 승인&거절 */
//	@Override
//	public boolean updateStore(StoreVO store) {
//		if(store == null) {
//			return false;
//		}
//		return storeDao.updateStore(store);
//	}

	@Override
	public boolean makeStore(ManagerVO manager) {
		if(manager == null || manager.getBm_id() == null) {
			return false;
		}
		// alert가 안뜨고, st_bm_id가 중복으로 저장됨..... 
		// 예외처리가 덜 된걸까? 왜..중복..?ㅠ 
		
		// 아니면 만들어 줘!
		return storeDao.makeStore(manager);
	}
	
	/** 매장등록 추가정보 입력 및 업데이트 */
	@Override
	public boolean plusInfo(StoreVO store, ManagerVO buser, MultipartFile[] files) {
		if(store == null || buser == null || buser.getBm_id() == null ) {
			return false;
		}

		// 첨부파일 추가
		uploadFiles(files, store.getSt_num());
		
		// 이미 st_num발급되면서 아이디와 승인정보 넘어가있음
		// store.setSt_bm_id(buser.getBm_id()); // bm_id값은 set으로 st_bm_id에 값 넣으면, buser 안넘겨도됨..ㅜㅠㅠ
		return storeDao.updatePlusInfo(store, buser);
	}

	private void uploadFiles(MultipartFile[] files, int st_num) {
		if(files == null || files.length == 0) {
			return;
		}
		if(st_num <= 0) {
			return;
		}
		for(MultipartFile file : files) { // files에서 하나 꺼내서 file이라는 참조변수를 만듦 
			if(file == null || file.getOriginalFilename().length() == 0) {
				continue;
			}
			try {
				String im_ori_name = file.getOriginalFilename();
				String im_name = uploadFileUtils.uploadFile(uploadPath, im_ori_name, file.getBytes());
				String im_tableName = null;
				int im_tableNum = 0;
				
				ImageVO imageVo = new ImageVO(im_name, im_ori_name, im_tableName, im_tableNum);
				storeDao.insertImage(imageVo);
				
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
	}

	
	@Override
	public int getStore(ManagerVO buser) {
		return storeDao.getStore(buser);
	}

	@Override
	public int getApprovalByBmId(String bm_id) {
		return storeDao.getApprovalByBmId(bm_id);
	}
}