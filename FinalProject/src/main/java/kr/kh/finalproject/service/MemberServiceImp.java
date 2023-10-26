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
		return memberDao.insertMember(member);
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



	@Override
	public MemberVO login(MemberVO member) {
		if (!checkIdRegex(member.getMe_oi_id()) || !checkPwRegex(member.getMe_pw())) {
			return null;
		}
		// ���̵�� ��ġ�ϴ� ȸ�� ������ ������
		MemberVO user = memberDao.selectMember(member.getMe_oi_id());
		System.out.println(user);
		// ���̵�� ��ġ�ϴ� ȸ�� ������ �ְ�, ����� ��ġ�ϸ�
		//if (user != null && passwordEncoder.matches(member.getMe_pw(), user.getMe_pw())) {
		if (user != null && user.getMe_pw().equals(member.getMe_pw())) {
			return user;
		}
		return null;
	}

	private boolean checkIdRegex(String id) {
		// ��ü 6~20��, �������� ����, ���� ���ڸ� ����
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