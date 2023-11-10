package kr.kh.finalproject.controller;



import java.util.List;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.kh.finalproject.service.BagService;
import kr.kh.finalproject.vo.MemberVO;
import kr.kh.finalproject.vo.MenuVO;
import kr.kh.finalproject.vo.Option_ChoiceVO;


@Controller
public class BagController {
	
	@Autowired
	private BagService bagService;

	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	
	@RequestMapping(value="/order/bag", method=RequestMethod.GET)
	public String signup(HttpSession session, MenuVO menu, Model model) {
    	MemberVO user = (MemberVO)session.getAttribute("user");
    	List<Option_ChoiceVO> jangbaguni = bagService.bagList(user);

    	
    	model.addAttribute("menu", menu);
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
        String selected = result.toString();
        boolean hasBag = bagService.hasBag(user);
        if(!hasBag) {
        	boolean makeBag = bagService.makeBag(user);
        }
        
        int bagBunho = bagService.bagBunho(user);

        boolean selectedOption = bagService.selectedOption(selected, total, menu_num, bagBunho);
        

        return "";
    }
    
    @PostMapping("/order/bag")
    @ResponseBody
    public String killAme(@RequestParam("oc_num") int oc_num) {
        boolean deleteItem = bagService.deleteItem(oc_num);
        
        return "";
    }

    
	
}