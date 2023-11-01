package kr.kh.finalproject.service;

import java.util.regex.Pattern;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import kr.kh.finalproject.dao.ManagerDAO;
import kr.kh.finalproject.vo.ManagerVO;

@Service
public class ManagerServiceImp implements ManagerService{

	@Autowired ManagerDAO managerDao;
	@Autowired BCryptPasswordEncoder passwordEncoder;
	
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

		ManagerVO user2 = managerDao.selectManager(manager.getBm_id());
		System.out.println(user2);
		
		if (user2 != null && passwordEncoder.matches(manager.getBm_pw(), user2.getBm_pw())) {
			return user2;
		}
		return null;
	}

	@Override
	public void updateMemberSession(Object user2) {
		if(user2 == null) {
			return;
		}
		managerDao.updateMemberSession(user2);
	}

	@Override
	public ManagerVO getMemberBySessionId(String bId) {
		return managerDao.selectMemberBySessionId(bId);
	}

}
