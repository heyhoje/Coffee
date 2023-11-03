package kr.kh.finalproject.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.concurrent.CopyOnWriteArrayList;

import org.json.simple.JSONObject;
import org.springframework.http.MediaType;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.mvc.method.annotation.SseEmitter;

@RestController
public class NotificationController {

	public List<SseEmitter> emitters = new CopyOnWriteArrayList<>();
	
	// method for subscription
	
	@CrossOrigin
	@RequestMapping(value="/Notification", consumes = MediaType.ALL_VALUE)
	public SseEmitter subscribe() {
		SseEmitter sseEmitter = new SseEmitter(Long.MAX_VALUE);
		try {
			sseEmitter.send(SseEmitter.event().name("INIT").data("connected"));
		} catch (IOException e) {
			e.printStackTrace();
			
		}
		sseEmitter.onCompletion(() ->emitters.remove(sseEmitter));
		emitters.add(sseEmitter);
		return sseEmitter;
	}
	
	//method for dispatching events to all clients
	@PostMapping(value="/dispatchEvent")
	public void dispatchEventToClient(@RequestParam String Menu, @RequestParam String content) {
		
		HashMap<String, Object> HashMap = new HashMap<String, Object>();
		JSONObject jobj = new JSONObject();
		String eventFormatted = ((HashMap) jobj.put("Menu", Menu)).put("content", content).toString();
		for(SseEmitter emitter : emitters) {
			try {
				emitter.send(SseEmitter.event().name("주문리스트").data(eventFormatted));
			} catch (IOException e) {
				emitters.remove(emitter);
			}		
		}
	}
}