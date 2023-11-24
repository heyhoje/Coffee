package kr.kh.finalproject.service;

import javax.mail.MessagingException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Service;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class MailServiceImp implements MailService{

	private final JavaMailSender javaMailSender;
    private static final String senderEmail= "2hae9999@gmail.com";
    private static int number;
    
	private MimeMessage CreateMail(String me_email) {
		createNumber();
        MimeMessage message = javaMailSender.createMimeMessage();

        try {
            message.setFrom(new InternetAddress(senderEmail));
            message.setRecipients(MimeMessage.RecipientType.TO, me_email);
            message.setSubject("이메일 인증");
            String body = "";
            body += "<h3>" + "요청하신 인증 번호입니다." + "</h3>";
            body += "<h1>" + number + "</h1>";
            body += "<h3>" + "감사합니다." + "</h3>";
            message.setText(body,"UTF-8", "html");
        } catch (MessagingException e) {
            e.printStackTrace();
        }

        return message;
	}

	
	private void createNumber() {
		number = (int)(Math.random() * (90000)) + 100000;// (int) Math.random() * (최댓값-최소값+1) + 최소값
		
	}


	@Override
	public int sendMail(String me_email){
		
		MimeMessage message = CreateMail(me_email);
		
		javaMailSender.send(message);
		
		return number;
	}
}
