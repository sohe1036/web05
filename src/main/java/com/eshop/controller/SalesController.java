package com.eshop.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.eshop.dto.GoodsDTO;
import com.eshop.dto.SalesDTO;
import com.eshop.service.GoodsService;
import com.eshop.service.SalesService;

@Controller
@RequestMapping("/sales/*")
public class SalesController {

	@Autowired
	SalesService salesService;
	
	@Autowired
	GoodsService goodsService;
	/*
	@RequestMapping("list.do")
	public String salesList(Model model) throws Exception {
		List<SalesDTO> salesList = salesService.salesList();
		model.addAttribute("salesList", salesList);
		return "sales/salesList";
	}
	*/

	//아이디별 리스트
	@RequestMapping("idList.do")
	public String salesIdList(@RequestParam("uid") String uid, Model model) throws Exception { 
		List<SalesDTO> salesList = salesService.salesIdList(uid);
		model.addAttribute("salesList", salesList);
		return "sales/salesList";
	}
	
	//주분번호별 결제상세보기
	@RequestMapping(value="detail.do", method = RequestMethod.GET )
	public String salesDetail(@RequestParam("ono") int ono, Model model) throws Exception {
		SalesDTO sales = salesService.salesDetail(ono);
		model.addAttribute("sales", sales);
		return "sales/salesDetail";
	}
	
	//배송정보 변경폼 
	@RequestMapping(value="edit.do", method = RequestMethod.GET )
	public String salesEdit(@RequestParam("ono") int ono, Model model) throws Exception {
		SalesDTO sales = salesService.salesDetail(ono);
		model.addAttribute("sales", sales);
		return "sales/salesUpdateForm";
	}
		/*
	//운송정보 입력폼
	@RequestMapping(value="rstate.do")
	public String rstateForm(@RequestParam("ono") int ono, Model model) throws Exception {
		SalesDTO sales = salesService.salesDetail(ono);
		model.addAttribute("sales", sales);
		return "sales/rstateForm";
	}
	*/
	//결제 폼
	@RequestMapping(value="salesForm.do")
	public String salesForm(GoodsDTO gdto,Model model) throws Exception{
		GoodsDTO goods = new GoodsDTO();
		goods.setGname(gdto.getGname());
		goods.setGno(gdto.getGno());
		goods.setGimg1(gdto.getGimg1());
		goods.setPieces(gdto.getPieces());
		goods.setPrice(gdto.getPrice());
		model.addAttribute("goods", goods);
		return "sales/salesForm";
	}
	
	//결제 주문처리
		@RequestMapping(value="insert.do", method = RequestMethod.POST)
		public String salesInsert(SalesDTO sdto,Model model) throws Exception {
			salesService.salesInsert(sdto);
			return "redirect:idList.do?uid="+sdto.getUid();
		}
	/*
	//배송처리 ->운송장 입력
	@RequestMapping(value="addShipping.do" , method = RequestMethod.POST)
	public String addShipping(SalesDTO sdto, Model model) throws Exception {
		salesService.addShipping(sdto);
		return "redirect:detail.do?ono="+sdto.getOno();
	}
	*/
	
	//주문수정-주소, 수취인명 수정
	@RequestMapping(value="update.do", method = RequestMethod.POST)
	public String salesUpdate(SalesDTO sdto, Model model) throws Exception {
		salesService.salesUpdate(sdto);
		return "redirect:detail.do?ono="+sdto.getOno();
	}
	
	//결제취소
	@RequestMapping(value="delete.do",  method = RequestMethod.GET)
	public String salesDelete(SalesDTO sdto,@RequestParam("ono") int ono,@RequestParam("gno") int gno, Model model) throws Exception {
		GoodsDTO goods = new GoodsDTO();
		goods.setGno(sdto.getGno());
		goods.setPieces(sdto.getPieces());
		salesService.salesDelete(goods,ono);
		String uid = sdto.getUid();
		return "redirect:idList.do?uid="+uid;
	}
}
