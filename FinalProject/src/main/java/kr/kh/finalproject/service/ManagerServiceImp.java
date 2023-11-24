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
//		System.out.println(buser);
		
		if (buser != null && passwordEncoder.matches(manager.getBm_pw(), buser.getBm_pw())) {
			return buser;
		}
		return null;
	}
	
	/** 자동 로그인 */
	@Override
	public void updateBMemberSession(ManagerVO buser) {
		if(buser == null) {
			return;
		}
		managerDao.updateBMemberSession(buser);
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
	//아이디 찾기
	@Override
	public ManagerVO managerIdSearch(ManagerVO manager) {
		return managerDao.managerIdSearch(manager);
	}
	//비밀번호 찾기
	@Override
	public int managerPwdCheck(ManagerVO manager) throws Exception {
		return managerDao.managerPwdCheck(manager);
	}
	
	@Override
	public void passwordUpdate(ManagerVO manager) throws Exception {
		managerDao.passwordUpdate(manager);
	}
	//비밀번호 변경
	@Override
	public String pwCheck(String bm_pw) throws Exception {
		return managerDao.pwCheck(bm_pw);
	}

	@Override
	public void pwUpdate(String bm_id, String enpassword) throws Exception {
		managerDao.pwUpdate(bm_id, enpassword);
		
	}

	@Override
	public void deleteManager(String bm_id) throws Exception {
		managerDao.deleteManager(bm_id);
	}

	@Override
	public void infoUpdate(ManagerVO manager) throws Exception {
		managerDao.infoUpdate(manager);
	}

	@Override
	public String getSesstionSt_num(ManagerVO buser) {
		return managerDao.getSesstionSt_num(buser);
	}


//	@Override
//	public int getTotalCount(ManagerVO manager, Criteria cri) {
//		if(cri == null) {
//			cri = new Criteria();
//		}
//		return managerDao.selectCountManagerList(manager, cri);
//	}

}
