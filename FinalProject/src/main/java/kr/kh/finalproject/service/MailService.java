package kr.kh.finalproject.service;

import org.springframework.stereotype.Service;

@Service
public interface MailService {

	int sendMail(String mail);

}
