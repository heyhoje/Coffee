package kr.kh.finalproject.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.kh.finalproject.pagination.Criteria;
import kr.kh.finalproject.pagination.PageMaker;
import kr.kh.finalproject.service.ManagerService;
import kr.kh.finalproject.vo.ManagerVO;

@Controller
public class ManagerController {

	@Autowired
	ManagerService managerService;

	@RequestMapping(value = "/manager/signup2", method = RequestMethod.GET)
	public String signup() {

		return "/manager/signup2";
	}

	@RequestMapping(value = "/manager/signup2", method = RequestMethod.POST)
	public String managerRegister(ManagerVO manager, Model model) {
		boolean res = managerService.managerRegister(manager);
		if (res) {
			model.addAttribute("msg", "회원가입이 제출되었습니다. \n관리자 승인은 운영시간내 13시, 17시에 일괄 진행며 승인확인까지 로그인이 제한될 수 있습니다.");
			model.addAttribute("url", "");
		} else {
			model.addAttribute("msg", "회원가입에 실패하였습니다. 다시 시도 부탁드립니다.");
			model.addAttribute("url", "manager/signup2");
		}
		return "/main/message";
	}

	@ResponseBody
	@PostMapping("/manager/id/check")
	public boolean manageridCheck(@RequestParam("id") String id) {
		return managerService.manageridCheck(id);
	}

	@RequestMapping(value = "/member/forgotpw2", method = RequestMethod.GET)
	public String forgotpw2() {

		return "/member/forgotpw";
	}

	// 사업자로그인
	@GetMapping("/member/login2")
	public String login() {
		return "/member/login";
	}

	@PostMapping("/member/login2")
	public String loginPost(Model model, ManagerVO manager) {
		// 입력받은 회원정보와 일치하는 회원 정보가 있으면 가져오라고 요청
		System.out.println(manager);
		ManagerVO buser = managerService.login(manager);
		
		/* /main/message를 통해 msg, url을 보내는 경우, 
		 *  이미 location.href = '<c:url value="/"/>' + url;
		 *  로 '/'가 추가되있기 때문에 앞에있는 슬러쉬를 지워줘야한다!!  */
		
		if (buser != null && buser.getBm_approval() == 0) {
			model.addAttribute("buser", buser);
			model.addAttribute("type", "b");
			model.addAttribute("msg", "회원가입 승인이 대기중입니다. 조금만 기다려주세요. \n (추후 관리자에게 문의하는 기능이 추가될 예정입니다.");
			model.addAttribute("url", ""); // 홈으로 이동을 안하네..... 
		
		} else if(buser != null && buser.getBm_approval() == 1) {
			model.addAttribute("buser", buser);
			model.addAttribute("type", "b");
			model.addAttribute("msg", "로그인 정보가 확인되었습니다. 즐거운 하루 되세요!");
			model.addAttribute("url", "business/home"); // 사이트연결안됨. 오타확인하라고함.
			
			// 화면에서 보낸 자동 로그인 체크 여부를 user에 적용
			buser.setAutoLogin(manager.isAutoLogin());
			
		} else{ // 잘못입력했을때, 메세지가 안뜨고 NullPointException 화면이 뜸
			model.addAttribute("msg", "아이디 또는 비밀번호가 잘못되었습니다.");
			model.addAttribute("url", "member/login2");
		}
		return "/main/message";
	}
	
	@PostMapping("/member/logout2")
	public String logout(Model model, HttpSession session) {
		
//		Object user2 = session.getAttribute("buser");
//		session.removeAttribute("buser");
		
		// session_limit null값, 없데이트, 세션에서 user정보 제거
		ManagerVO buser = (ManagerVO)session.getAttribute("buser");
		
		buser.setBm_session_limit(null);
		managerService.updateBMemberSession(buser); // 자동로그인을 안하기 위해
		
		session.removeAttribute("buser"); // 일반 로그아웃을 위해

		/*
		 * if(user2 != null) { user2.setMe_session_limit(null);
		 * managerService.updateMemberSession(user2); }
		 */

		model.addAttribute("msg", "로그아웃되었습니다. 좋은 하루 되세요!");
		model.addAttribute("url", "");
		return "/main/message";
	}

}

