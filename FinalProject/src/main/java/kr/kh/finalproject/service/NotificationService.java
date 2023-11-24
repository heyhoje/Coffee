package kr.kh.finalproject.service;

import org.springframework.web.servlet.mvc.method.annotation.SseEmitter;

public interface NotificationService {

	SseEmitter subscribe(Long userId);

	

	

	/**
	 * 서버의 이벤트를 클라이언트에게 보내는 메서드
	 * 다른 서비스 로직에서 이 메서드를 사용해 데이터를 Object event에 넣고 전송하면 된다.
	 *
	 * @param userId - 메세지를 전송할 사용자의 아이디.
	 * @param event  - 전송할 이벤트 객체.
	 */

	
	
	
}
