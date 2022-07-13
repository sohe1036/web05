package com.eshop.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.eshop.dto.ReviewDTO;
import com.eshop.dto.SalesDTO;
import com.eshop.service.ReviewService;

@Controller
@RequestMapping("/review/*")
public class ReviewController {
	
	@Autowired
	ReviewService reviewService;
	
	//리뷰목록
	@RequestMapping("list.do")
	public String reviewList(@RequestParam("gno") int gno, Model model) throws Exception{
		List<ReviewDTO> reviewList = reviewService.reviewList(gno);
		model.addAttribute("reviewList", reviewList);
		return "review/reviewList";
	}
	
	//아디디별 리뷰목록
	@RequestMapping("idList.do")
	public String reviewList(@RequestParam("uid") String uid, Model model) throws Exception{
		List<ReviewDTO> reviewIdList = reviewService.reviewIdList(uid);
		model.addAttribute("reviewIdList", reviewIdList);
		return "review/reviewIdList";
	}
	
	//리뷰 상세보기
	@RequestMapping(value="read.do" , method = RequestMethod.GET)
	public String reviewRead(ReviewDTO rdto, Model model) throws Exception {
		ReviewDTO review = new ReviewDTO();
		model.addAttribute("review", review);
		return "review/reviewIdList?uid="+review.getUid();
	}
	
	//리뷰쓰기
	@RequestMapping(value="insert.do", method = RequestMethod.POST)
	public String reviewInsert(ReviewDTO rdto, Model model) throws Exception {
		reviewService.reviewInsert(rdto);
		return "redirect:/reviewIdList?uid="+rdto.getUid();
	}
	
	//리뷰체크
	@RequestMapping(value="reviewCheck", method = RequestMethod.GET)
	public String reviewCheck(@RequestParam ("ono") int ono, Model model) throws Exception{
		int cnt = reviewService.reviewCheck(ono);
		
		if(cnt>0) {
			model.addAttribute("ck", null);
			model.addAttribute("msg", "이미 리뷰를 작성하셨습니다");
		}else {
			model.addAttribute("ck", "yes");
		}
		return "sales/salesList";
	}
	
	//리뷰작성폼 
	@RequestMapping(value="reviewForm.do")
	public String reviewForm(SalesDTO sdto,Model model) throws Exception {
		SalesDTO sales = new SalesDTO();
		sales.setGno(sdto.getGno());
		sales.setUid(sdto.getUid());
		sales.setGname(sdto.getGname());
		sales.setOno(sdto.getOno());
		model.addAttribute("sales", sales);
		return "review/reviewForm";
	}
	
	//리뷰수정
	@RequestMapping(value="update.do" ,method = RequestMethod.POST )
	public String reviewUpdate(ReviewDTO rdto,  Model model ) throws Exception {
		reviewService.reviewUpdate(rdto);
		return "redirect:/reviewIdList?uid="+rdto.getUid();
	}
	
	//리뷰수정폼
	@RequestMapping(value="editForm.do")
	public String reviewEditForm(Model model) throws Exception {
		return "review/reviewEditForm";
	}
	
	//리뷰삭제
	@RequestMapping(value="delete.do")
	public String reviewDelete(@RequestParam("uno") int  uno ,HttpSession session, Model model) throws Exception {
		reviewService.reviewDelete(uno);
		return "redirect:/reviewIdList?uid="+session.getId();
	}
}
