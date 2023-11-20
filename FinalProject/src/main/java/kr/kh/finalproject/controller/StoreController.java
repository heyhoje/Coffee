package kr.kh.finalproject.controller;


	
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import kr.kh.finalproject.pagination.Criteria;
import kr.kh.finalproject.service.ShopService;
import kr.kh.finalproject.vo.ManagerVO;

@Controller
public class StoreController {
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	@Autowired
	private ShopService shopService;
		
	@RequestMapping(value="/order/store", method=RequestMethod.GET)
	public String store(Model model, Criteria cri) {
		List<ManagerVO> shopList = shopService.getShopList(cri);
		

		model.addAttribute("shopList", shopList);
		return "/order/store";
	}
		

}