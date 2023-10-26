package kr.kh.finalproject.service;

import java.util.regex.Pattern;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import kr.kh.finalproject.dao.BusinessMemberDAO;
import kr.kh.finalproject.vo.BusinessMemberVO;

@Service
public class BusinessMemberServiceImp implements BusinessMemberService{

	@Autowired
	private BusinessMemberDAO businessMemberDao;

	@Autowired
	private BCryptPasswordEncoder passwordEncoder;
	
	@Override
	public boolean checkId(String id) {
		return businessMemberDao.selectMember(id) == null;
	}

	@Override
	public BusinessMemberVO login(BusinessMemberVO businessMember) {
		if (!checkIdRegex(businessMember.getBm_id()) || !checkPwRegex(businessMember.getBm_pw())) {
			return null;
		}
		BusinessMemberVO user2 = businessMemberDao.selectMember(businessMember.getBm_id());
		System.out.println(user2);
		if (user2 != null && user2.getBm_pw().equals(businessMember.getBm_pw())) {
			return user2;
		}
		return null;
	}

	private boolean checkIdRegex(String id) {
		String regexId = "^[a-zA-Z]\\w{4,15}$";
		if (id == null) {
			return false;
		}
		return Pattern.matches(regexId, id);
	}

	private boolean checkPwRegex(String pw) {
		String regexPw = "\\w{8,20}";
		if (pw == null) {
			return false;
		}
		return Pattern.matches(regexPw, pw);
	}

	@Override
	public void updateMemberSession(BusinessMemberVO user2) {
		if(user2 == null) {
			return;
		}
		businessMemberDao.updateMemberSession(user2);
		
	}

	@Override
	public BusinessMemberVO getMemberBySessionId(String sbId) {
		return businessMemberDao.selectMemberBySessionId(sbId);
	}

}
