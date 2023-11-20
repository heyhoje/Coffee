package kr.kh.finalproject.controller;

import java.io.IOException;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.mvc.method.annotation.SseEmitter;

import kr.kh.finalproject.service.StoreService;
import kr.kh.finalproject.vo.ManagerVO;
import kr.kh.finalproject.vo.StoreVO;
	

@RestController
public class NotificationController {
	private final Map<Integer, SseEmitter> storesEmitters = new ConcurrentHashMap<Integer, SseEmitter>();
	private final Map<String, Object> eventCache = new ConcurrentHashMap<String, Object>();
	//Object 형변환 Int로 바꿀
	//리스트 말고 맵으로 해서 매장번호, emitter
	//매장용 emitter 필요
	//사업자번호, emitter 점주 상시 로그인
	// 고객 주문완료 버튼 누르면 주문전송

	@Autowired
	private StoreService storeService;
	
	@CrossOrigin
	@RequestMapping(value="/Notification/business", produces = MediaType.ALL_VALUE)
	public SseEmitter subscribe(HttpServletRequest request) {
			HttpSession session = request.getSession();
			ManagerVO user = (ManagerVO)session.getAttribute("buser");
			StoreVO store = storeService.getStore(user.getBm_num());
			final SseEmitter sseEmitter = new SseEmitter(Long.MAX_VALUE);
			try {
				sseEmitter.send(SseEmitter.event().name("INIT").data("connected"));
			} catch (IOException e) {
				e.printStackTrace();
				
			}
			sseEmitter.onCompletion(new Runnable() {
				@Override
				public void run() {
					storesEmitters.remove(store.getSt_num());
					}
			});
			storesEmitters.put(store.getSt_num(), sseEmitter);
			return sseEmitter;
		}

//method for dispatching events to all clients
	@PostMapping(value="/call/order")
	public void dispatchEventToClient(@RequestParam String menuName, @RequestParam String selectOption, int st_num) {
		System.out.println(menuName);
		System.out.println(selectOption);
		try {
			storesEmitters.get(st_num).send(SseEmitter.event().name("order").data("connected"));
		} catch (IOException e) {
			e.printStackTrace();
			}
		}
	}
	/*JSONObject eventformatted = new JSONObject();
	HashMap<String, String> shopmap = new HashMap<String, String>();
		shopmap.put("menuName", menuName);
		shopmap.put("selectOption", selectOption);
		eventformatted.put(menuName, selectOption);
		model.addAttribute("shopmap", shopmap);
		System.out.println(shopmap);
		
	for (Map.Entry<String, String> pair : shopmap.entrySet()) {
		  System.out.println(String.format("Key (메뉴) is: %s, Value (수량) is : %s", pair.getKey(), pair.getValue()));
	}
	for (Map.Entry<String, SseEmitter> m : emitters.entrySet()) {
		try {
			m.getValue().send(SseEmitter.event().name("주문리스트").data(menuName));
		} catch (IOException e) {
			e.printStackTrace();
			}
		}*/        


	
	
	
	
	
	
	/* NotificationDAO notificationDao;
		
	public List<SseEmitter> emitters = new CopyOnWriteArrayList<>();
	//Object 형변환 Int로 바꿀
	//리스트 말고 맵으로 해서 매장번호, emitter
	//매장용 emitter 필요
	//사업자번호, emitter 점주 상시 로그인
	// 고객 주문완료 버튼 누르면 주문전송
	
	// method for client subscription
	
	@CrossOrigin
	@RequestMapping(value="/business/order/1", consumes = MediaType.ALL_VALUE)
	public SseEmitter subscribe(HttpServletRequest request) {
		SseEmitter sseEmitter = new SseEmitter(Long.MAX_VALUE);
		try {
			sseEmitter.send(SseEmitter.event().name("INIT"));
		} catch (IOException e) {
			e.printStackTrace();
		}
		emitters.add(sseEmitter);
		return sseEmitter;
	}
	
	//method for dispatching events to all clients
	 @PostMapping(value="/dispatchEvent")
	public void dispatchEventToClient(@RequestParam Long orderId) {
		
		Option_ChoiceVO optionChoice = notificationDao.getOrderbyId(orderId);
		String eventFormatted = new JSONObject()
				.put("menuName",optionChoice.getMenuName())
				.put("optionchoice",optionChoice.getOptionChoice())
				.put("quantity",optionChoice.Getquantity())
				.toString();
		for( SseEmitter emitter : emitters) {
			try {
				emitter.send(SseEmitter.event().name("주문리스트").data(eventFormatted));
			}catch(IOException e) {
				emitters.remove(emitter);
       */
	