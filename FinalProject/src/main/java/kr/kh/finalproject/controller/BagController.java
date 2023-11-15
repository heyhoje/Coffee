package kr.kh.finalproject.controller;



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
import kr.kh.finalproject.vo.MemberVO;
import kr.kh.finalproject.vo.Option_ChoiceVO;
import kr.kh.finalproject.vo.ShopVO;


@Controller
public class BagController {
	
	@Autowired
	private BagService bagService;

	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	
	@RequestMapping(value="/order/bag", method=RequestMethod.GET)
	public String signup(HttpSession session, Model model) {
    	MemberVO user = (MemberVO)session.getAttribute("user");
    	List<Option_ChoiceVO> jangbaguni = bagService.bagList(user); // 장바구니 목록 표출을 위한 option_choice, shop_basket, menu, image 조인 결과 리스트
    	List<ShopVO> shop = bagService.shopInfo(user);
    	int point = bagService.getPoint(user);	// 장바구니 페이지에 현재 보유 포인트를 보여주기 위한 메서드
    	int basketNum = bagService.getBasketNum(user);
    	
    	model.addAttribute("basketNum", basketNum);
    	model.addAttribute("point", point);
    	model.addAttribute("shop", shop);
    	model.addAttribute("user", user);
    	model.addAttribute("jangbaguni", jangbaguni);
		return "/order/bag";
	}
	
    @PostMapping("/order/bag1")
    @ResponseBody
    public String addToBag(HttpSession session, @RequestParam("optionAll") String optionAll, @RequestParam("menu_num") int menu_num) {
    	MemberVO user = (MemberVO)session.getAttribute("user");

        
        String[] parts = optionAll.split(", "); // 쉼표와 공백으로 문자열을 분할

        int total = 0; // 계산 결과를 저장할 변수
        StringBuilder result = new StringBuilder(); // 변환된 문자열을 저장할 StringBuilder

        for (String part : parts) {
            String[] keyValue = part.split(" "); // 공백으로 문자열을 키와 값으로 분할
            if (keyValue.length == 2) {
                String key = keyValue[0];
                String value = keyValue[1];

                // key를 결과 문자열에 추가
                result.append(key);
                result.append(", ");

                // value를 정수로 파싱하여 total에 더함
                try {
                    int numericValue = Integer.parseInt(value);
                    total += numericValue;
                } catch (NumberFormatException e) {
                    // 정수로 파싱할 수 없는 경우 무시
                }
            }
        }

        // 마지막 ", " 문자 제거
        if (result.length() >= 2) {
            result.setLength(result.length() - 2);
        }
        String selected = result.toString(); // 선택된 옵션 값들 중 가격을 제외한 text 부분의 합
        // 아이디에 따라 장바구니 데이터가 있는지 확인하고 없으면 만들어주는 메서드
        boolean hasBag = bagService.hasBag(user);	
        if(!hasBag) {
        	boolean makeBag = bagService.makeBag(user);
        }
        
        int bagBunho = bagService.bagBunho(user);
        
        // 한 매장에서 메뉴를 장바구니에 등록하고, 다른 매장에서 메뉴를 장바구니에 등록하려 할 때 이전 매장에서 등록한 메뉴들을 삭제하는 메서드
        int sameShop = bagService.sameShop(user);
        int anotherShop = bagService.anotherShop(menu_num);
        if(sameShop != anotherShop) {
        	boolean flipBag = bagService.flipBag(user);
        }
        boolean selectedOption = bagService.selectedOption(selected, total, menu_num, bagBunho);	// option_choice 테이블에 선택된 옵션과 메뉴 번호 가격 등을 insert 해주는 메서드 
        

        return "";
    }
    
    @PostMapping("/order/bag")
    @ResponseBody
    public String killAme(@RequestParam("oc_num") int oc_num) {
    	// 장바구니에서 삭제 버튼 누를시 선택한 메뉴를 삭제해주는 메서드
        boolean deleteItem = bagService.deleteItem(oc_num);
        
        return "";
    }
    
    @PostMapping("/order/bagend")
    @ResponseBody
    public String savePoint(@RequestParam("point") int point, @RequestParam("usePoint") int usePoint, @RequestParam("user") String user, @RequestParam("menuName") String menuName) {
    	int givePoint = point/10; // 적립될 포인트 (총 가격 - 사용된 포인트) / 10 
        boolean jugiPoint = bagService.givePoint(givePoint, user); 
        boolean patgiPoint = bagService.steelPoint(usePoint, user); // 포인트로 사용으로 인한 포인트를 삭감 시키는 메서드
        boolean makeOrderMenu_List = bagService.makeOrderMenu(menuName); // 주문메뉴을 데이터를 insert 하는 메서드
        int getNumFromOM = bagService.getNumFromOM();	// 주문 목록을 만들기 위해 바로 위에서 만들어진 주문메뉴의 or_num을 가져오는 메서드
        int getSbNum = bagService.getBasketNum1(user);	// 주문 목록을 만들기 위해 장바구니 번호를 가져오는 메서드
        boolean makeOrderList = bagService.makeOrderList(user, getNumFromOM, getSbNum);	// 주문 목록을 만드는 메서드
        boolean deleteBag = bagService.killBag(user);	// 주문 완료 후 장바구니를 비워주는 메서드

        return "";
    }	
}