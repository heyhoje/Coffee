package kr.kh.finalproject.controller;


import java.util.Arrays;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.lang.RandomStringUtils;
import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.security.crypto.bcrypt.BCrypt;

import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.kh.finalproject.service.InterestService;
import kr.kh.finalproject.service.MemberService;
import kr.kh.finalproject.vo.InterestVO;
import kr.kh.finalproject.vo.MemberVO;
import kr.kh.finalproject.vo.UserVO;

@Controller
public class MemberController {

	@Autowired
	MemberService memberService;

	@Autowired
    private InterestService interestService;
	
	// 회원가입 페이지
	@RequestMapping(value = "/member/signup2", method = RequestMethod.GET)
	public String signup() {

		return "/member/signup2";
	}

	// 회원가입 기능구현 시작
	@RequestMapping(value = "/member/signup2", method = RequestMethod.POST)
	public String signupPost(MemberVO member, Model model) {
		System.out.println(member);
		boolean res = memberService.signup(member);
		if (res) {
			model.addAttribute("msg", "회원가입 성공했습니다. \\n 오늘 커피 한잔 어떠실까요?");
			model.addAttribute("url", "");
		} else {
			model.addAttribute("msg", "회원가입 실패했습니다. \\n다시 시도 부탁드립니다.");
			model.addAttribute("url", "member/signup2");
		}
		return "/main/message";
	}

	@RequestMapping(value="/member/mypage", method=RequestMethod.GET)
	public String mypage() {
		return "/member/mypage";
	}
	
	@ResponseBody
	@PostMapping("/member/id/check")
	public boolean idCheck(@RequestParam("id") String id) {
		return memberService.checkId(id);
	}

	// 아이디 찾기 페이지
	@RequestMapping(value = "/member/search_id", method = RequestMethod.GET)
	public String search_id(HttpServletRequest request, Model model, MemberVO member) {

		return "/member/search_id";
	}

	// 비밀번호 찾기 페이지
	@RequestMapping(value = "/member/search_pw", method = RequestMethod.GET)
	public String search_pw(HttpServletRequest request, Model model, MemberVO member) {

		return "/member/search_pw";
	}

	// 아이디 찾기 완료 후 페이지
	@RequestMapping(value = "/member/search_result_id")
	public String search_result_id(HttpServletRequest request, Model model,
			@RequestParam(required = true, value = "me_name") String me_name,
			@RequestParam(required = true, value = "me_email") String me_email, MemberVO member) {

		try {

			member.setMe_name(me_name);
			member.setMe_email(me_email);
			MemberVO memberSearch = memberService.memberIdSearch(member);

			model.addAttribute("member", memberSearch);
			System.out.println(member);
		} catch (Exception e) {
			System.out.println(e.toString());
			model.addAttribute("msg", "오류가 발생되었습니다.");
		}

		return "/member/search_result_id";
	}

	// 비밀번호 찾기 완료 후 페이지
	@RequestMapping(value = "/member/search_result_pw", method = RequestMethod.POST)
	public String search_result_pw(HttpServletRequest request, Model model,
			@RequestParam(required = true, value = "me_user_id") String me_user_id,
			@RequestParam(required = true, value = "me_name") String me_name,
			@RequestParam(required = true, value = "mail") String me_email, MemberVO member) {
		try {

			member.setMe_user_id(me_user_id);
			member.setMe_name(me_name);
			member.setMe_email(me_email);
			int memberSearch = memberService.memberPwdCheck(member);

			if (memberSearch == 0) {
				model.addAttribute("msg", "기입된 정보가 잘못되었습니다. 다시 입력해주세요.");
				return "/member/search_pw";
			}

			String me_pw = RandomStringUtils.randomAlphanumeric(10);
			String enpassword = encryptPassword(me_pw);
			member.setMe_pw(enpassword);

			memberService.passwordUpdate(member);

			model.addAttribute("me_pw", me_pw);

		} catch (Exception e) {
			System.out.println(e.toString());
			model.addAttribute("msg", "오류가 발생되었습니다.");
		}
		return "/member/search_result_pw";
	}

	private String encryptPassword(String password) {
		BCryptPasswordEncoder passwordEncoder = new BCryptPasswordEncoder();
		return passwordEncoder.encode(password);
	}

	// 회원 로그인
	@GetMapping("/member/login")
	public String login() {
		return "/member/login";
	}

	@PostMapping("/member/login")
	public String loginPost(Model model, MemberVO member) {
		// 입력받은 회원정보와 일치하는 회원 정보가 있으면 가져오라고 요청
		System.out.println(member);
		MemberVO user = memberService.login(member); // user 는 내가 입력한 아이디와 비번에 (맞는) db에서 일치하는 회원정보 가져와! 해서 가져온 회원정보
		// 가져왔으면 => 로그인 성공하면
		if (user != null) {
			model.addAttribute("user", user);
			model.addAttribute("type", "u");
			model.addAttribute("msg", "로그인 성공했습니다. 맛있는 커피와 함께 좋은하루 되세요:)");
			model.addAttribute("url", "");

			// 화면에서 보낸 자동 로그인 체크 여부를 user에 적용
			user.setAutoLogin(member.isAutoLogin());
		} else {
			model.addAttribute("type", "u");
			model.addAttribute("msg", "아이디 또는 비밀번호가 잘못되었습니다.");
			model.addAttribute("url", "");
		}
		return "/main/message";
	}

	@PostMapping("/member/logout")
	public String logout(Model model, HttpSession session) {

//		Object user = session.getAttribute("user"); // MemberVO user = (MemberVO)session.getAttribute("user"); 
//		session.removeAttribute("user");

		MemberVO user = (MemberVO) session.getAttribute("user");

		// session_limit null값, 업데이트, 세션에서 user정보 제거
		user.setMe_session_limit(null);
		memberService.updateMemberSession(user); // 자동로그인을 안하기 위해

		session.removeAttribute("user"); // 일반 로그아웃을 위해(세션에서만 유저정보를 없애면 로그인안한거로 인식됨)

		model.addAttribute("msg", "로그아웃 성공했습니다. 즐거운 하루 보내세요!");
		model.addAttribute("url", "");
		return "/main/message";
	}

	// 카카오
	@RequestMapping("/kakaoLoginCallback")
	public String kakaoLoginCallback(Model model, HttpServletRequest request, HttpServletResponse response) {
		String kakaoId = request.getParameter("kakaoId");
		String email = request.getParameter("email");
		String name = request.getParameter("name");
		String phone_number = request.getParameter("phone_number");

		boolean isUserExisting = memberService.checkUserExists(kakaoId);

		if (isUserExisting) {
			MemberVO existingUser = memberService.getMemberByKakaoId(kakaoId);
			if (existingUser != null) {
				HttpSession session = request.getSession();
				session.setAttribute("user", existingUser);
			}
		} else {
			// 카카오 로그인 정보를 User 테이블에 삽입
			UserVO user = new UserVO();
			user.setUser_id(kakaoId);
			user.setUser_phone(phone_number);
			user.setUser_aorb("회원"); // user_aorb 값을 설정
			System.out.println(user);
			// User 정보를 추가하는 메서드를 호출
			memberService.insertUserKakaoInfo(user);

			// 카카오 로그인 정보를 Member 테이블에 삽입
			MemberVO member = new MemberVO();
			member.setMe_user_id(kakaoId);
			member.setMe_email(email);
			member.setMe_name(name);
			memberService.insertMemberKakao(member);
			System.out.println(member);

			HttpSession session = request.getSession();
			session.setAttribute("user", member);
		}
		return "/main/message";
	}

	// 비밀번호 변경
	@RequestMapping(value = "/member/pwchange", method = RequestMethod.GET)
	public String pwchange() throws Exception {
		return "/member/pwchange";
	}

	// 회원탈퇴
	@RequestMapping(value = "/member/deleteMember", method = RequestMethod.GET)
	public String deleteMember() throws Exception {
		return "/member/deleteMember";
	}

	@RequestMapping(value = "/member/delete", method = RequestMethod.POST)
	public String delete(String me_user_id, Model model, HttpSession session) throws Exception {
		memberService.deleteMember(me_user_id);
		memberService.deleteUser(me_user_id);
		session.invalidate();
		model.addAttribute("msg", "이용해주셔서 감사합니다.");
		return "/main/message";
	}

	@RequestMapping(value = "/member/pwCheck", method = RequestMethod.POST)
	@ResponseBody
	public int pwCheck(MemberVO member) throws Exception {
		// DB에서 해당 사용자의 해시된 비밀번호 가져오기
		System.out.println(member);
		String me_pw = memberService.pwCheck(member.getMe_user_id());
		System.out.println(me_pw);
		// 만약 DB에서 가져온 비밀번호가 null이거나 비밀번호가 일치하지 않으면 0을 반환
		if (me_pw == null || !BCrypt.checkpw(member.getMe_pw(), me_pw)) {
			return 0;
		}

		// 비밀번호가 일치하면 1을 반환
		return 1;
	}

	@RequestMapping(value = "/member/pwUpdate", method = RequestMethod.POST)
	public String pwUpdate(String me_user_id, String me_pw1, Model model, HttpSession session) throws Exception {
		String enpassword = encryptPassword(me_pw1);
		memberService.pwUpdate(me_user_id, enpassword);
		System.out.println(me_user_id);
		System.out.println(me_pw1);
		System.out.println(enpassword);
		session.invalidate();
		model.addAttribute("msg", "비밀번호 변경이 완료되었습니다. 다시 로그인해주세요.");

		return "/main/message";
	}

	// 회원정보수정
	@RequestMapping(value = "/member/infoUpdate", method = RequestMethod.POST)
	public String infoUpdate(HttpServletRequest request, HttpSession session,@RequestParam(value = "memberInterests", required = false) String[] memberInterests, MemberVO member, Model model) throws Exception {
		if (memberInterests != null && memberInterests.length > 0) {
	        // 관심사를 회원 정보에 추가 또는 업데이트하는 작업
			interestService.deleteMemberInterests(member.getMe_user_id());
	        List<String> interestsList = Arrays.asList(memberInterests);
	        interestService.updateMemberInterests(member.getMe_user_id(), interestsList);
	        System.out.println(interestsList);
	    }
		memberService.infoUpdate(member);
		session.invalidate();
		model.addAttribute("msg", "정보 수정이 완료되었습니다. 다시 로그인해주세요.");
		return "/main/message";
	}
}