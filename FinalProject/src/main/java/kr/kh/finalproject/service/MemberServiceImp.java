package kr.kh.finalproject.service;


import java.util.regex.Pattern;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import kr.kh.finalproject.dao.MemberDAO;
import kr.kh.finalproject.vo.InterestVO;
import kr.kh.finalproject.vo.KakaoVO;
import kr.kh.finalproject.vo.MemberVO;
import kr.kh.finalproject.vo.UserVO;


@Service
public class MemberServiceImp implements MemberService {

	@Autowired MemberDAO memberDao;
	@Autowired BCryptPasswordEncoder passwordEncoder;
	
	/** 회원가입, 정규화체크, 중복확인, 로그인 */
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
	@Override
	public boolean checkId(String id) {
		return memberDao.selectMember(id) == null;
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
	public MemberVO login(MemberVO member) {
		if (!checkIdRegex(member.getMe_user_id()) || !checkPwRegex(member.getMe_pw())) {
			return null;
		}

		MemberVO user = memberDao.selectMember(member.getMe_user_id());
		System.out.println(user);
		
		if (user != null && passwordEncoder.matches(member.getMe_pw(), user.getMe_pw())) {
			return user;
		}
		return null;
	}
	
	/** 일반회원 - 자동 로그인 */
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
	
	/** 카카오 로그인 */
	@Override
    public void insertMemberKakao(MemberVO member) {
        memberDao.insertMemberKakao(member);
    }

    @Override
    public MemberVO selectMemberKakao(String kakaoUserId) {
        return memberDao.selectMemberKakao(kakaoUserId);
    }
	@Override
	public void insertUserKakaoInfo(UserVO user) {
		memberDao.insertUserKakaoInfo(user);
		
	}
	@Override
	public UserVO selectUserKakaoInfo(String userId) {
		return memberDao.selectUserKakaoInfo(userId);
	}
	@Autowired
	public MemberServiceImp(MemberDAO memberDao) {
	    this.memberDao = memberDao;
	}



	@Override
	public boolean checkUserExists(String kakaoId) {
		int count = memberDao.checkUserExists(kakaoId);
        return count > 0;
	}

	@Override
	public MemberVO getMemberByKakaoId(String kakaoId) {
	    return memberDao.getMemberByKakaoId(kakaoId);
	}

	//아이디찾기
	@Override
	public MemberVO memberIdSearch(MemberVO memberSearch) {
		return memberDao.memberIdSearch(memberSearch);
	}
	//비밀번호찾기
	@Override
	public int memberPwdCheck(MemberVO member) {
		return memberDao.memberPwdCheck(member);
	}
	@Override
	public void passwordUpdate(MemberVO member) {
		memberDao.passwordUpdate(member);
	}
	//비밀번호변경
	@Override
	public void pwUpdate(String me_user_id, String enpassword)throws Exception {
		memberDao.pwUpdate(me_user_id, enpassword);
		
	}
	@Override
	public String pwCheck(String me_pw) throws Exception {
		return memberDao.pwCheck(me_pw);
	}
	@Override
	public void deleteMember(String me_user_id) throws Exception {
		memberDao.deleteMember(me_user_id);
	}
	@Override
	public void deleteUser(String me_user_id) throws Exception {
		memberDao.deleteUser(me_user_id);
	}
	@Override
	public void infoUpdate(MemberVO member) throws Exception {
		memberDao.infoUpdate(member);
	}
	@Override
	public void interestUpdate(InterestVO interest) throws Exception {
		memberDao.interestUpdate(interest);
	}
	
}