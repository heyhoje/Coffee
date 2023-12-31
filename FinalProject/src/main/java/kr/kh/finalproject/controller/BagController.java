package kr.kh.finalproject.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.kh.finalproject.service.BagService;
import kr.kh.finalproject.vo.ManagerVO;
import kr.kh.finalproject.vo.MemberVO;
import kr.kh.finalproject.vo.Option_ChoiceVO;
import kr.kh.finalproject.vo.OrderMenuVO;

@Controller
public class BagController {
	
	@Autowired
	private BagService bagService;

	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	
	@RequestMapping(value="/order/bag", method=RequestMethod.GET)
	public String signup(HttpSession session, Model model) {
    	MemberVO user = (MemberVO)session.getAttribute("user");
		String id = user.getMe_user_id();
    	List<Option_ChoiceVO> jangbaguni = bagService.bagList(id);
    	System.out.println(jangbaguni);
    	List<ManagerVO> shop = bagService.shopInfo(id);
    	int point = bagService.getPoint(id);
    	int basketNum = bagService.getBasketNum(id);
    	
    	model.addAttribute("basketNum", basketNum);
    	model.addAttribute("point", point);
    	model.addAttribute("shop", shop);
    	model.addAttribute("user", user);
    	model.addAttribute("jangbaguni", jangbaguni);
		return "/order/bag";
	}
	
    @PostMapping("/order/bag1")
    @ResponseBody
    public String addToBag(HttpSession session, @RequestParam("optionAll") String optionAll, @RequestParam("menu_num") int menu_num, @RequestParam("menu_price") int menu_price) {
    	MemberVO user = (MemberVO)session.getAttribute("user");
    	String id = user.getMe_user_id();
        
        String[] parts = optionAll.split(","); 

        int total = 0;
        StringBuilder result = new StringBuilder(); 

        for (String part : parts) {
            String[] keyValue = part.split(" "); 
            if (keyValue.length == 2) {
                String key = keyValue[0];
                String value = keyValue[1];
                
                result.append(key);
                result.append(", ");

                try {
                    int numericValue = Integer.parseInt(value);
                    total += numericValue;
                } catch (NumberFormatException e) {
                }
            }
        }

        if (result.length() >= 2) {
            result.setLength(result.length() - 2);
        }
        String selected = result.toString(); 
        boolean hasBag = bagService.hasBag(id);	
        if(!hasBag) {
        	boolean makeBag = bagService.makeBag(id);
        }
        
        int bagBunho = bagService.bagBunho(id);
        
//        int sameShop = bagService.sameShop(user);
//        int anotherShop = bagService.anotherShop(menu_num);
//        if(sameShop != anotherShop) {
//        	boolean flipBag = bagService.flipBag(user);
//        }
        boolean selectedOption = bagService.selectedOption(selected, total, menu_num, bagBunho);	
        

        return "";
    }
    
    @PostMapping("/order/bag")
    @ResponseBody
    public String killAme(@RequestParam("oc_num") int oc_num) {
        boolean deleteItem = bagService.deleteItem(oc_num);
        
        return "";
    }
    
    @PostMapping("/order/bagend")
    @ResponseBody
    public String savePoint(@RequestParam("point") int point, @RequestParam("usePoint") int usePoint, 
    		@RequestParam("user") String id, @RequestParam("menuName") String menuName, @RequestParam("menuNum") String menuNum, @RequestParam("selectOption") String selectOption) {
//    	System.out.println(point);
//    	System.out.println(usePoint);
//    	System.out.println(id);
//    	System.out.println(menuName);
//    	System.out.println(menuNum);
    	int givePoint = point/10; 
        boolean jugiPoint = bagService.givePoint(givePoint, id); 
        boolean patgiPoint = bagService.steelPoint(usePoint, id); 
        boolean makeOrderMenu_List = bagService.makeOrderMenu(menuName, menuNum, selectOption); 
        int getNumFromOM = bagService.getNumFromOM();	
        int getSbNum = bagService.getBasketNum1(id);	
        boolean makeOrderList = bagService.makeOrderList(id, getNumFromOM, getSbNum);	
        boolean deleteBag = bagService.killBag(id);	

        return "/order/bagconfirm";
    }	
	@RequestMapping(value = "/order/confirm")
	public String orderconfirm(HttpSession session, Model model) {
    	MemberVO user = (MemberVO)session.getAttribute("user");
    	String id = user.getMe_user_id();
    	OrderMenuVO orderMenu = bagService.getOrderMenu(id);
    	System.out.println("orderMenu: " + orderMenu);

		model.addAttribute("orderMenu", orderMenu);
		return "/order/confirm";
	}
	
	
	 // 문자열을 ','를 기준으로 나누어 리스트로 저장하는 메소드
	 private static List<String> splitAndToList(String input) {
		 String[] array = input.split(",");
		 List<String> list = new ArrayList<String>();
		 for (String value : array) {
			 list.add(value);
		 }
		 return list;
	 }
}