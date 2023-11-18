package kr.kh.finalproject.controller;



import java.util.Map;

import java.security.MessageDigest;
import java.util.Base64;
import java.util.UUID;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.lang.RandomStringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DuplicateKeyException;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.kh.finalproject.service.MemberService;
import kr.kh.finalproject.util.Message;
import kr.kh.finalproject.vo.MemberVO;
import kr.kh.finalproject.vo.UserVO;

@Controller
public class MemberController {

	@Autowired
	MemberService memberService;

	// �쉶�썝媛��엯 �럹�씠吏�
	@RequestMapping(value = "/member/signup2", method = RequestMethod.GET)
	public String signup() {

		return "/member/signup2";
	}

	// �쉶�썝媛��엯 湲곕뒫援ы쁽 �떆�옉
	@RequestMapping(value = "/member/signup2", method = RequestMethod.POST)
	public String signupPost(MemberVO member, Model model) {
		System.out.println(member);

		boolean res = memberService.signup(member);
		if (res) {
			model.addAttribute("msg", "�쉶�썝媛��엯 �꽦怨듯뻽�뒿�땲�떎. \n �삤�뒛 而ㅽ뵾 �븳�옍 �뼱�뼚�떎源뚯슂?");
			model.addAttribute("url", "");
		} else {
			model.addAttribute("msg", "�쉶�썝媛��엯 �떎�뙣�뻽�뒿�땲�떎. \n�떎�떆 �떆�룄 遺��긽�뱶由쎈땲�떎.");
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

	// �븘�씠�뵒 李얘린 �럹�씠吏�
	@RequestMapping(value = "/member/search_id", method = RequestMethod.GET)
	public String search_id(HttpServletRequest request, Model model, MemberVO member) {

		return "/member/search_id";
	}

	// 鍮꾨�踰덊샇 李얘린 �럹�씠吏�
	@RequestMapping(value = "/member/search_pw", method = RequestMethod.GET)
	public String search_pw(HttpServletRequest request, Model model, MemberVO member) {

		return "/member/search_pw";
	}

	// �븘�씠�뵒 李얘린 �셿猷� �썑 �럹�씠吏�
	@RequestMapping(value = "/member/search_result_id")
	public String search_result_id(HttpServletRequest request, Model model,
			@RequestParam(required = true, value = "me_name") String me_name,
			@RequestParam(required = true, value = "me_email") String me_email, MemberVO member) {

		try {

			member.setMe_name(me_name);
			member.setMe_email(me_email);
			MemberVO memberSearch = memberService.memberIdSearch(member);

			model.addAttribute("member", memberSearch);

		} catch (Exception e) {
			System.out.println(e.toString());
			model.addAttribute("msg", "�삤瑜섍� 諛쒖깮�릺�뿀�뒿�땲�떎.");
		}

		return "/member/search_result_id";
	}

	// 鍮꾨�踰덊샇 李얘린 �셿猷� �썑 �럹�씠吏�
	@RequestMapping(value = "/member/search_result_pw", method = RequestMethod.POST)
	public String search_result_pw(HttpServletRequest request, Model model,
			@RequestParam(required = true, value = "me_user_id") String me_user_id, 
		    @RequestParam(required = true, value = "me_name") String me_name, 
		    @RequestParam(required = true, value = "me_email") String me_email, 
		    MemberVO member) {
		try {
		    
			member.setMe_user_id(me_user_id);
			member.setMe_name(me_name);
			member.setMe_email(me_email);
		    int memberSearch = memberService.memberPwdCheck(member);
		    
		    if(memberSearch == 0) {
		        model.addAttribute("msg", "湲곗엯�맂 �젙蹂닿� �옒紐삳릺�뿀�뒿�땲�떎. �떎�떆 �엯�젰�빐二쇱꽭�슂.");
		        return "/member/search_pw";
		    }
		    
		    String newPw = RandomStringUtils.randomAlphanumeric(10);
		    String enpassword = encryptPassword(newPw);
		    member.setMe_pw(enpassword);
	        
		    memberService.passwordUpdate(member);
		    
		    model.addAttribute("newPw", newPw);
		    
		} catch (Exception e) {
		    System.out.println(e.toString());
		    model.addAttribute("msg", "�삤瑜섍� 諛쒖깮�릺�뿀�뒿�땲�떎.");
		}
		return "/member/search_result_pw";
	}
	private String encryptPassword(String password) {
		BCryptPasswordEncoder passwordEncoder = new BCryptPasswordEncoder();
		return passwordEncoder.encode(password);
	}

	// �쉶�썝 濡쒓렇�씤
	@GetMapping("/member/login")
	public String login() {
		return "/member/login";
	}

	@PostMapping("/member/login")
	public String loginPost(Model model, MemberVO member) {
		// �엯�젰諛쏆� �쉶�썝�젙蹂댁� �씪移섑븯�뒗 �쉶�썝 �젙蹂닿� �엳�쑝硫� 媛��졇�삤�씪怨� �슂泥�
		System.out.println(member);
		MemberVO user = memberService.login(member); // user �뒗 �궡媛� �엯�젰�븳 �븘�씠�뵒�� 鍮꾨쾲�뿉 (留욌뒗) db�뿉�꽌 �씪移섑븯�뒗 �쉶�썝�젙蹂� 媛��졇��! �빐�꽌 媛��졇�삩 �쉶�썝�젙蹂�
		// 媛��졇�솕�쑝硫� => 濡쒓렇�씤 �꽦怨듯븯硫�
		if (user != null) {
			model.addAttribute("user", user);
			model.addAttribute("type", "u");
			model.addAttribute("msg", "濡쒓렇�씤 �꽦怨듯뻽�뒿�땲�떎. 留쏆엳�뒗 而ㅽ뵾�� �븿猿� 醫뗭��븯猷� �릺�꽭�슂:)");
			model.addAttribute("url", "");

			// �솕硫댁뿉�꽌 蹂대궦 �옄�룞 濡쒓렇�씤 泥댄겕 �뿬遺�瑜� user�뿉 �쟻�슜
			user.setAutoLogin(member.isAutoLogin());
		} else {
			model.addAttribute("msg", "�븘�씠�뵒 �삉�뒗 鍮꾨�踰덊샇媛� �옒紐삳릺�뿀�뒿�땲�떎.");
			model.addAttribute("url", "member/login");
		}
		return "/main/message";
	}

	@PostMapping("/member/logout")
	public String logout(Model model, HttpSession session) {

//		Object user = session.getAttribute("user"); // MemberVO user = (MemberVO)session.getAttribute("user"); 
//		session.removeAttribute("user");
		
		MemberVO user = (MemberVO)session.getAttribute("user");
		
		// session_limit null媛�, �뾽�뜲�씠�듃, �꽭�뀡�뿉�꽌 user�젙蹂� �젣嫄�
		user.setMe_session_limit(null);
		memberService.updateMemberSession(user); // �옄�룞濡쒓렇�씤�쓣 �븞�븯湲� �쐞�빐
		
		session.removeAttribute("user"); // �씪諛� 濡쒓렇�븘�썐�쓣 �쐞�빐(�꽭�뀡�뿉�꽌留� �쑀���젙蹂대�� �뾾�븷硫� 濡쒓렇�씤�븞�븳嫄곕줈 �씤�떇�맖)
		

		model.addAttribute("msg", "濡쒓렇�븘�썐 �꽦怨듯뻽�뒿�땲�떎. 利먭굅�슫 �븯猷� 蹂대궡�꽭�슂!");
		model.addAttribute("url", "");
		return "/main/message";
	}

	// 移댁뭅�삤
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
			// 移댁뭅�삤 濡쒓렇�씤 �젙蹂대�� User �뀒�씠釉붿뿉 �궫�엯
			UserVO user = new UserVO();
			user.setUser_id(kakaoId);
			user.setUser_phone(phone_number);
			user.setUser_aorb("�쉶�썝"); // user_aorb 媛믪쓣 �꽕�젙
			System.out.println(user);
			// User �젙蹂대�� 異붽��븯�뒗 硫붿꽌�뱶瑜� �샇異�
			memberService.insertUserKakaoInfo(user);

			// 移댁뭅�삤 濡쒓렇�씤 �젙蹂대�� Member �뀒�씠釉붿뿉 �궫�엯
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
}


	



