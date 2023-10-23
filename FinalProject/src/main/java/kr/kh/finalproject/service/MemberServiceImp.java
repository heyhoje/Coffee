package kr.kh.finalproject.service;

import java.util.regex.Pattern;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import kr.kh.finalproject.dao.MemberDAO;
import kr.kh.finalproject.vo.MemberVO;

@Service
public class MemberServiceImp implements MemberService {

	@Autowired 
	private MemberDAO memberDao;
	
	@Autowired 
	private BCryptPasswordEncoder passwordEncoder;
	
	/*
	 * @Override public boolean signup(MemberVO member) { if(member == null) {
	 * return false; } MemberVO dbMember =
	 * memberDao.selectMember(member.getMe_oi_num());
	 * 
	 * if(dbMember != null) { return false; } if(!Pattern.matches(idRegex,
	 * member.getMe_oi_num())) { return false; } if(!Pattern.matches(pwRegex,
	 * member.getMe_pw())) { return false; }
	 * 
	 * String encPw = passwordEncoder.encode(member.getMe_pw());
	 * member.setMe_pw(encPw); return memberDao.insertMember(member); }
	 */

}
