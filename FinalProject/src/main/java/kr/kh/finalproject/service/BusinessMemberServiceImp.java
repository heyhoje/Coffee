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
		if (!checkIdRegex(businessMember.getBm_Id()) || !checkPwRegex(businessMember.getBm_Pw())) {
			return null;
		}
		// 아이디와 일치하는 회원 정보를 가져옴
		BusinessMemberVO user2 = businessMemberDao.selectMember(businessMember.getBm_Id());
		System.out.println(user2);
		// 아이디와 일치하는 회원 정보가 있고, 비번이 일치하면
		//if (user != null && passwordEncoder.matches(member.getMe_pw(), user.getMe_pw())) {
		if (user2 != null && user2.getBm_Pw().equals(businessMember.getBm_Pw())) {
			return user2;
		}
		return null;
	}

	private boolean checkIdRegex(String id) {
		// 전체 6~20자, 영문으로 시작, 영문 숫자만 가능
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
