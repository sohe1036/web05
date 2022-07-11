package com.eshop.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.eshop.dto.CartDTO;
import com.eshop.service.CartService;

@Controller
@RequestMapping("/cart/*")
public class CartController {

	@Autowired
	CartService cartService;
	
	//장바구니 목록
	@RequestMapping("list.do")
	public String cartList(@RequestParam("uid") String uid,Model model) throws Exception {
		List<CartDTO> cartList = cartService.cartList(uid);
		model.addAttribute("cartList", cartList);
		return "cart/cartList";
	}
	
	//장바구니 상세보기
	@RequestMapping(value="cartDetail.do", method= RequestMethod.GET)
	public String cartDetail(@RequestParam("bno") int bno,@RequestParam("uid") String uid, CartDTO cdto ,Model model) throws Exception {
		CartDTO cartDetail = new CartDTO();
		cartDetail.setBno(bno);
		cartDetail.setUid(uid);
		CartDTO cart = cartService.cartDetail(cdto);
		model.addAttribute("cart", cart);
		return "cart/cartDetail";
	}
	
	//추가폼
	@RequestMapping(value="addCartForm.do", method= RequestMethod.GET)
	public String addCartForm(CartDTO cdto, Model model)throws Exception {
		String gname = cdto.getGname();
		String gimg1 = cdto.getGimg1();
		int pieces = cdto.getPieces();
		int gno = cdto.getGno();
		String gcolor = cdto.getGcolor();
		String price = cdto.getPrice();
		model.addAttribute("gimg1", gimg1);
		model.addAttribute("gname",gname);
		model.addAttribute("pieces", pieces);
		model.addAttribute("gno", gno);
		model.addAttribute("gcolor", gcolor);
		model.addAttribute("price", price);

		return "cart/addCartForm";
	}
	
	//장바구니 추가
	@RequestMapping(value="insert.do", method= RequestMethod.POST)
	public String cartInsert(@RequestParam("uid") String uid,CartDTO cdto, Model model) throws Exception {
		cartService.cartInsert(cdto);
		return "redirect:list.do?uid="+cdto.getUid();
	}
	
	//장바구니 체크
	@RequestMapping(value="check.do" , method= RequestMethod.GET)
	public String cartCheck(@RequestParam int gno,@RequestParam String uid,CartDTO cdto,Model model) throws Exception {
		CartDTO cart = new CartDTO();
		cart.setGno(gno);
		cart.setUid(uid);
		int cnt = cartService.cartCheck(cart);
		if(cnt==0) {
			model.addAttribute("ck", "yes");
		}else {
			model.addAttribute("ck", "no");
		}
		return "cart/addCartForm";
	}
	
	//장바구니 수정
	@RequestMapping(value="update.do" ,method = RequestMethod.POST)
	public String cartUpdate (CartDTO cdto, Model model) throws Exception {
		cartService.cartUpdate(cdto);
		return "redirect:list.do?uid="+cdto.getUid();
	}
	
	//장바구니 삭제
	@RequestMapping(value="delete.do" ,method= RequestMethod.GET )
	public String cartDelete(@RequestParam("bno") int bno,@RequestParam("uid") String uid, Model model) throws Exception {
		cartService.cartDelete(bno);
		return "redirect:list.do?uid="+uid;
	}
}
