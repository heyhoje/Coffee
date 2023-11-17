package kr.kh.finalproject.service;

import java.util.List;
import java.util.regex.Pattern;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import kr.kh.finalproject.dao.ManagerDAO;
import kr.kh.finalproject.pagination.Criteria;
import kr.kh.finalproject.vo.ManagerVO;

@Service
public class ManagerServiceImp implements ManagerService{

	@Autowired 
	ManagerDAO managerDao;
	@Autowired 
	BCryptPasswordEncoder passwordEncoder;
	
	@Override
	public boolean managerRegister(ManagerVO manager) {
		if(manager == null) {
			return false;
		}
		if(!checkIdRegex(manager.getBm_id()) || !checkPwRegex(manager.getBm_pw())) {
			return false;
		}
		
		ManagerVO dbManager = managerDao.selectManager(manager.getBm_id());
		
		if(dbManager != null) {
			return false;
		}
		
		String encodedPassword = passwordEncoder.encode(manager.getBm_pw());
		
		manager.setBm_pw(encodedPassword);
		
		return managerDao.insertManager(manager);
	}

	private boolean checkPwRegex(String pw) {
		String regexPw = "\\w{6,20}";
		if(pw == null) {
			return false;
		}
		return Pattern.matches(regexPw, pw);
	}

	private boolean checkIdRegex(String id) {
		String regexId = "^[a-zA-Z]\\w{5,19}$";
		if(id == null) {
			return false;
		}
		return Pattern.matches(regexId, id);
	}

	@Override
	public boolean manageridCheck(String id) {
		return managerDao.selectManager(id) == null;
	}


	@Override
	public ManagerVO login(ManagerVO manager) {
		if (!checkIdRegex(manager.getBm_id()) || !checkPwRegex(manager.getBm_pw())) {
			return null;
		}

		ManagerVO buser = managerDao.selectManager(manager.getBm_id());
		System.out.println(buser);
		
		if (buser != null && passwordEncoder.matches(manager.getBm_pw(), buser.getBm_pw())) {
			return buser;
		}
		return null;
	}
	
	/** 자동 로그인 */
	@Override
	public void updateBMemberSession(ManagerVO user) {
		if(user == null) {
			return;
		}
		managerDao.updateBMemberSession(user);
	}

	@Override
	public ManagerVO getBMemberBySessionId(String bId) {
		return managerDao.selectBMemberBySessionId(bId);
	}

	/** 사이트 관리자 페이지 */
	@Override
	public List<ManagerVO> getBMemberList(int bm_approval) {

		return managerDao.selectBMemberList(bm_approval);
	}
	
	@Override
	public int getTotalCount(ManagerVO manager, Criteria cri) {
		// TODO Auto-generated method stub
		return 0;
	}
	
	/** 승인&거절 버튼 */
	@Override
	public boolean updateManager(ManagerVO manager) {
		if(manager == null || manager.getBm_id() == null) {
			return false;
		}
		return managerDao.updateManager(manager);
	}

//	@Override
//	public int getTotalCount(ManagerVO manager, Criteria cri) {
//		if(cri == null) {
//			cri = new Criteria();
//		}
//		return managerDao.selectCountManagerList(manager, cri);
//	}

}
