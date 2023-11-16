package kr.kh.finalproject.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
import org.springframework.http.MediaType;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.mvc.method.annotation.SseEmitter;

import kr.kh.finalproject.vo.ShopVO;

@RestController
public class NotificationController {

	private final Map<String, SseEmitter> emitters = new ConcurrentHashMap<String, SseEmitter>();
	private final Map<String, Object> eventCache = new ConcurrentHashMap<String, Object>();
	//Object 형변환 Int로 바꿀
	//리스트 말고 맵으로 해서 매장번호, emitter
	//매장용 emitter 필요
	//사업자번호, emitter 점주 상시 로그인
	// 고객 주문완료 버튼 누르면 주문전송
	
	// method for subscription
	
	@CrossOrigin
	@RequestMapping(value="/Notification", produces = MediaType.ALL_VALUE)
	public SseEmitter subscribe(HttpServletRequest request) {
		HttpSession session = request.getSession();
		ShopVO shop = (ShopVO)session.getAttribute("bm_num");
		final SseEmitter sseEmitter = new SseEmitter(Long.MAX_VALUE);
		try {
			sseEmitter.send(SseEmitter.event().name("INIT").data("connected"));
		} catch (IOException e) {
			e.printStackTrace();
			
		}
		sseEmitter.onCompletion(new Runnable() {
			@Override
			public void run() {
				emitters.remove(sseEmitter);
			}
		});
		emitters.put("bm_num", sseEmitter);
		return sseEmitter;
	}
	
	//method for dispatching events to all clients
	@PostMapping(value="/dispatchEvent")
	public void dispatchEventToClient(@RequestParam String Menu, @RequestParam String content, Model model) {
		
		JSONObject eventformatted = new JSONObject();
		HashMap<String, String> shopmap = new HashMap<String, String>();
			shopmap.put("title", Menu);
			shopmap.put("text", content);
			eventformatted.put(Menu, content);
			model.addAttribute("shopmap", shopmap);
			System.out.println(shopmap);

			
		for (Map.Entry<String, String> pair : shopmap.entrySet()) {
			  System.out.println(String.format("Key (메뉴) is: %s, Value (수량) is : %s", pair.getKey(), pair.getValue()));
		}
		for (Map.Entry<String, SseEmitter> m : emitters.entrySet()) {
			try {
				m.getValue().send(SseEmitter.event().name("주문리스트").data(Menu));
			} catch (IOException e) {
				e.printStackTrace();
			}
		}        
	}
}
