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
    	List<Option_ChoiceVO> jangbaguni = bagService.bagList(user); // �옣諛붽뎄�땲 紐⑸줉 �몴異쒖쓣 �쐞�븳 option_choice, shop_basket, menu, image 議곗씤 寃곌낵 由ъ뒪�듃
    	List<ShopVO> shop = bagService.shopInfo(user);
    	int point = bagService.getPoint(user);	// �옣諛붽뎄�땲 �럹�씠吏��뿉 �쁽�옱 蹂댁쑀 �룷�씤�듃瑜� 蹂댁뿬二쇨린 �쐞�븳 硫붿꽌�뱶
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

        
        String[] parts = optionAll.split(", "); // �돹�몴�� 怨듬갚�쑝濡� 臾몄옄�뿴�쓣 遺꾪븷

        int total = 0; // 怨꾩궛 寃곌낵瑜� ���옣�븷 蹂��닔
        StringBuilder result = new StringBuilder(); // 蹂��솚�맂 臾몄옄�뿴�쓣 ���옣�븷 StringBuilder

        for (String part : parts) {
            String[] keyValue = part.split(" "); // 怨듬갚�쑝濡� 臾몄옄�뿴�쓣 �궎�� 媛믪쑝濡� 遺꾪븷
            if (keyValue.length == 2) {
                String key = keyValue[0];
                String value = keyValue[1];

                // key瑜� 寃곌낵 臾몄옄�뿴�뿉 異붽�
                result.append(key);
                result.append(", ");

                // value瑜� �젙�닔濡� �뙆�떛�븯�뿬 total�뿉 �뜑�븿
                try {
                    int numericValue = Integer.parseInt(value);
                    total += numericValue;
                } catch (NumberFormatException e) {
                    // �젙�닔濡� �뙆�떛�븷 �닔 �뾾�뒗 寃쎌슦 臾댁떆
                }
            }
        }

        // 留덉�留� ", " 臾몄옄 �젣嫄�.
        if (result.length() >= 2) {
            result.setLength(result.length() - 2);
        }
        String selected = result.toString(); // �꽑�깮�맂 �샃�뀡 媛믩뱾 以� 媛�寃⑹쓣 �젣�쇅�븳 text 遺�遺꾩쓽 �빀
        // �븘�씠�뵒�뿉 �뵲�씪 �옣諛붽뎄�땲 �뜲�씠�꽣媛� �엳�뒗吏� �솗�씤�븯怨� �뾾�쑝硫� 留뚮뱾�뼱二쇰뒗 硫붿꽌�뱶
        boolean hasBag = bagService.hasBag(user);	
        if(!hasBag) {
        	boolean makeBag = bagService.makeBag(user);
        }
        
        int bagBunho = bagService.bagBunho(user);
        
        // �븳 留ㅼ옣�뿉�꽌 硫붾돱瑜� �옣諛붽뎄�땲�뿉 �벑濡앺븯怨�, �떎瑜� 留ㅼ옣�뿉�꽌 硫붾돱瑜� �옣諛붽뎄�땲�뿉 �벑濡앺븯�젮 �븷 �븣 �씠�쟾 留ㅼ옣�뿉�꽌 �벑濡앺븳 硫붾돱�뱾�쓣 �궘�젣�븯�뒗 硫붿꽌�뱶
        int sameShop = bagService.sameShop(user);
        int anotherShop = bagService.anotherShop(menu_num);
        if(sameShop != anotherShop) {
        	boolean flipBag = bagService.flipBag(user);
        }
        boolean selectedOption = bagService.selectedOption(selected, total, menu_num, bagBunho);	// option_choice �뀒�씠釉붿뿉 �꽑�깮�맂 �샃�뀡怨� 硫붾돱 踰덊샇 媛�寃� �벑�쓣 insert �빐二쇰뒗 硫붿꽌�뱶 
        

        return "";
    }
    
    @PostMapping("/order/bag")
    @ResponseBody
    public String killAme(@RequestParam("oc_num") int oc_num) {
    	// �옣諛붽뎄�땲�뿉�꽌 �궘�젣 踰꾪듉 �늻瑜쇱떆 �꽑�깮�븳 硫붾돱瑜� �궘�젣�빐二쇰뒗 硫붿꽌�뱶.
        boolean deleteItem = bagService.deleteItem(oc_num);
        
        return "";
    }
    
    @PostMapping("/order/bagend")
    @ResponseBody
    public String savePoint(@RequestParam("point") int point, @RequestParam("usePoint") int usePoint, 
    		@RequestParam("user") String user, @RequestParam("menuName") String menuName, @RequestParam("menuNum") String menuNum) {
    	int givePoint = point/10; // �쟻由쎈맆 �룷�씤�듃 (珥� 媛�寃� - �궗�슜�맂 �룷�씤�듃) / 10 
        boolean jugiPoint = bagService.givePoint(givePoint, user); 
        boolean patgiPoint = bagService.steelPoint(usePoint, user); // �룷�씤�듃濡� �궗�슜�쑝濡� �씤�븳 �룷�씤�듃瑜� �궘媛� �떆�궎�뒗 硫붿꽌�뱶
        boolean makeOrderMenu_List = bagService.makeOrderMenu(menuName, menuNum); // 二쇰Ц硫붾돱�쓣 �뜲�씠�꽣瑜� insert �븯�뒗 硫붿꽌�뱶

        int getNumFromOM = bagService.getNumFromOM();	// 二쇰Ц 紐⑸줉�쓣 留뚮뱾湲� �쐞�빐 諛붾줈 �쐞�뿉�꽌 留뚮뱾�뼱吏� 二쇰Ц硫붾돱�쓽 or_num�쓣 媛��졇�삤�뒗 硫붿꽌�뱶
        int getSbNum = bagService.getBasketNum1(user);	// 二쇰Ц 紐⑸줉�쓣 留뚮뱾湲� �쐞�빐 �옣諛붽뎄�땲 踰덊샇瑜� 媛��졇�삤�뒗 硫붿꽌�뱶
        boolean makeOrderList = bagService.makeOrderList(user, getNumFromOM, getSbNum);	// 二쇰Ц 紐⑸줉�쓣 留뚮뱶�뒗 硫붿꽌�뱶
        boolean deleteBag = bagService.killBag(user);	// 二쇰Ц �셿猷� �썑 �옣諛붽뎄�땲瑜� 鍮꾩썙二쇰뒗 硫붿꽌�뱶

        return "/order/bagconfirm";
    }	
}