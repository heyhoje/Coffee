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
	@Override
	public boolean checkId(String id) {
		return memberDao.selectMember(id) == null;
	}

	@Override
	public MemberVO login(MemberVO member) {
		if (!checkIdRegex(member.getMe_oi_id()) || !checkPwRegex(member.getMe_pw())) {
			return null;
		}
		// 아이디와 일치하는 회원 정보를 가져옴
		MemberVO user = memberDao.selectMember(member.getMe_oi_id());
		System.out.println(user);
		// 아이디와 일치하는 회원 정보가 있고, 비번이 일치하면
		//if (user != null && passwordEncoder.matches(member.getMe_pw(), user.getMe_pw())) {
		if (user != null && user.getMe_pw().equals(member.getMe_pw())) {
			return user;
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
	public void updateMemberSession(MemberVO user) {
		if(user == null) {
			return;
		}
		memberDao.updateMemberSession(user);
		
	}

	@Override
	public MemberVO getMemberBySessionId(String sId) {
		return memberDao.selectMemberBySessionId(sId);
	}
}