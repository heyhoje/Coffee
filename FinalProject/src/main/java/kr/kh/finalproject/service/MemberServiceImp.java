package kr.kh.finalproject.service;


import java.util.regex.Pattern;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import kr.kh.finalproject.dao.MemberDAO;
import kr.kh.finalproject.vo.MemberVO;


@Service
public class MemberServiceImp implements MemberService {

	@Autowired MemberDAO memberDao;
	@Autowired BCryptPasswordEncoder passwordEncoder;
	
	@Override
	public boolean signup(MemberVO member) {
		if(member == null) {
			return false;
		}
		if(!checkIdRegex(member.getUser_id()) || !checkPwRegex(member.getMe_pw())) {
			return false;
		}
		
		MemberVO dbMember = memberDao.selectMember(member.getUser_id());
		
		if(dbMember != null) {
			return false;
		}
		String encodedPassword = passwordEncoder.encode(member.getMe_pw());
		
		member.setMe_pw(encodedPassword);
		memberDao.insertUser(member);
		memberDao.insertMember(member);
		return true;
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
	public boolean checkId(String id) {
		return memberDao.selectMember(id) == null;
	}



}
