package com.eshop.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.eshop.dto.GoodsDTO;
import com.eshop.service.GoodsService;

@Controller
@RequestMapping("/goods/*")
public class GoodsController {

	@Autowired
	GoodsService goodsService;
	
	/*@RequestMapping("실행경로")
	public String boardList(Model model) throws Exception {
		List<BoardDTO> boardList = boardService.boardList(); 리턴타입 변수명 = 서비스.메서드()
		model.addAttribute("boardList", boardList);
		return "리턴경로";
	}*/
	
	@RequestMapping("list.do")
	public String boardList(Model model) throws Exception {
		List<GoodsDTO> goodsList = goodsService.goodList();
		model.addAttribute("goodsList", goodsList);
		return "goods/goodsList";
	}
	
	@RequestMapping(value="typelist.do" , method= RequestMethod.GET)
	public String goodsTypeListe(GoodsDTO gdto, Model model) throws Exception {
		List<GoodsDTO> goodsTypeList = goodsService.goodsTypeList(gdto);
		model.addAttribute("goodsTypeList", goodsTypeList);
		return "goods/goodsTypeList";
	}
	
	@RequestMapping(value="detail.do" ,method= RequestMethod.GET )
	public String goodsDetail(@RequestParam int gno, Model model ) throws Exception {
		GoodsDTO goods = goodsService.goodsDetail(gno);
		model.addAttribute("goods", goods);
		return "goods/goodsDetail";
	}
	
	
	
	
	
	
}
