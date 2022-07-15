package com.eshop.myshop;

import java.text.DateFormat;
import java.util.Date;
import java.util.List;
import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.eshop.dto.GoodsDTO;
import com.eshop.service.GoodsService;


/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	
	@Autowired
	GoodsService goodsService;
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	
	/*
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		logger.info("Welcome home! The client locale is {}.", locale);
		
		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
		
		String formattedDate = dateFormat.format(date);
		
		model.addAttribute("serverTime", formattedDate );
		
		return "home";
	}
	*/
	/*
	//최신상품 목록
	@RequestMapping(value="/", method = RequestMethod.GET)
	public String latestGoods(Model model) throws Exception {
		List<GoodsDTO> latestGoods = goodsService.latestGoods();
		model.addAttribute("latestGoods", latestGoods);
		
		return "home";
	}
	*/
	//최신상품 목록
	//베스트 상품 목록
	@RequestMapping(value="/")
	public String goodsList(Model model) throws Exception {
		List<GoodsDTO> latestGoods = goodsService.latestGoods();
		List<GoodsDTO> goodsBestList = goodsService.bestGoods();
		model.addAttribute("latestGoods", latestGoods);
		model.addAttribute("goodsBestList", goodsBestList);
		return "home";
	}
	
}
