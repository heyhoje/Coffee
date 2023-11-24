package kr.kh.finalproject.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.kh.finalproject.service.MailService;
import lombok.RequiredArgsConstructor;

@Controller
public class MailController {
	@Autowired
	private MailService mailService;

	@ResponseBody
	@PostMapping("/mail")
	public String MailSend(String mail) {

		int number = mailService.sendMail(mail);

		String num = "" + number;

		return num;
	}
}
