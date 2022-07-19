package com.eshop.controller;


import java.io.File;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.eshop.dto.BoardDTO;
import com.eshop.dto.GoodsDTO;
import com.eshop.dto.MemberDTO;
import com.eshop.dto.NoticeDTO;
import com.eshop.dto.ReviewDTO;
import com.eshop.dto.SalesDTO;
import com.eshop.service.BoardService;
import com.eshop.service.GoodsService;
import com.eshop.service.MemberService;
import com.eshop.service.NoticeService;
import com.eshop.service.ReviewService;
import com.eshop.service.SalesService;
import com.eshop.util.PageMaker;

@Controller
@RequestMapping("/admin/")
public class AdminController {
	
	@Autowired
	MemberService memberService;
	
	@Autowired
	SalesService salesService;
	
	@Autowired
	GoodsService goodsService;

	@Autowired
	BoardService boardService;
	
	@Autowired
	NoticeService noticeService;
	
	@Autowired
	ReviewService reviewService;
	
	@Autowired
	BCryptPasswordEncoder passEncoder;
	
	@Autowired
	HttpSession session;
	
	@Resource(name = "uploadPath")
	private String uploadPath;
	
    @RequestMapping(value="/", method = RequestMethod.GET)
    public String adminRoot() {
        return "admin/admin";
    }
	
    @RequestMapping(value="admin.do", method = RequestMethod.GET)
    public String admin() {
        return "admin/admin";
    }
    /*회원*/
    //회원목록
    @RequestMapping("memberList.do")
  	public String memberList(Model model) throws Exception {
  		List<MemberDTO> memberList = memberService.memberList();
  		model.addAttribute("memberList", memberList);
  		return "admin/memberList";
  	}
  	//관리자용 회원 상세보기
    @RequestMapping(value="memberDetail.do" ,method = RequestMethod.GET )
	public String memberDetail(@RequestParam String uid, Model model) throws Exception {
		MemberDTO member = memberService.memberDetail(uid);
		model.addAttribute("member", member);
		return "admin/memberDetailAdmin";
	}
  	/*주문*/
  	//주문목록
	@RequestMapping("salesList.do")
	public String salesList(Model model) throws Exception {
		List<SalesDTO> salesList = salesService.salesList();
		model.addAttribute("salesList", salesList);
		return "admin/salesList";
	}
	
	//주분번호별 결제 상세보기
	@RequestMapping(value="salesDetail.do", method = RequestMethod.GET )
	public String salesDetail(@RequestParam("ono") int ono, Model model) throws Exception {
		SalesDTO sales = salesService.salesDetail(ono);
		model.addAttribute("sales", sales);
		return "admin/salesDetail";
	}
	
	
	//운송정보 입력폼
	@RequestMapping(value="rstate.do")
	public String rstateForm(@RequestParam("ono") int ono, Model model) throws Exception {
		SalesDTO sales = salesService.salesDetail(ono);
		model.addAttribute("sales", sales);
		return "admin/rstateForm";
	}
	
	//배송처리 ->운송장 입력
	@RequestMapping(value="addShipping.do" , method = RequestMethod.POST)
	public String addShipping(SalesDTO sdto, Model model) throws Exception {
		salesService.addShipping(sdto);
		return "redirect:salesDetail.do?ono="+sdto.getOno();
	}
	/*상품*/
	//상품목록
	@RequestMapping("goodsList.do")
	public String goodsList( Model model) throws Exception {
			List<GoodsDTO> goodsList = goodsService.goodList();
			model.addAttribute("goodsList", goodsList);
		return "admin/goodsList";
	}
	
	//상품 추가 폼
	@RequestMapping(value="goodsAddForm.do",method= RequestMethod.GET)
	public String goodsAddForm(Model model) throws Exception {
		return "admin/goodsAddForm";
	}
	
	//상품추가
	@RequestMapping(value="insert.do" , method = RequestMethod.POST)
	public String goodsInsert(MultipartFile gimg1,MultipartFile gimg2, HttpServletRequest request, Model model) throws Exception {
		if(!gimg2.isEmpty()) {
		
			String uploadFolder = "D:\\LIM\\jsp3\\web05\\src\\main\\webapp\\resources\\upload";
			String fileName = gimg1.getOriginalFilename();
			String fileName2 = gimg2.getOriginalFilename();
			File saveFile = new File(uploadFolder, fileName);
			File saveFile2 = new File(uploadFolder, fileName2);
			gimg1.transferTo(saveFile);
			gimg2.transferTo(saveFile2);
			GoodsDTO gdto = new GoodsDTO();
			gdto.setGname(request.getParameter("gname"));
			gdto.setGtype(request.getParameter("gtype"));
			gdto.setGshape(request.getParameter("gshape"));
			gdto.setGcolor(request.getParameter("gcolor"));
			gdto.setGimg1(fileName);
			gdto.setGimg2(fileName2);
			gdto.setGinfo(request.getParameter("ginfo"));
			gdto.setPrice(request.getParameter("price"));
			gdto.setPieces(Integer.parseInt(request.getParameter("pieces")));
			
			goodsService.goodsInsert(gdto);
		}else {
			String uploadFolder = "D:\\LIM\\jsp3\\web05\\src\\main\\webapp\\resources\\upload";
			String fileName = gimg1.getOriginalFilename();
			File saveFile = new File(uploadFolder, fileName);
			gimg1.transferTo(saveFile);
			GoodsDTO gdto = new GoodsDTO();
			gdto.setGname(request.getParameter("gname"));
			gdto.setGtype(request.getParameter("gtype"));
			gdto.setGshape(request.getParameter("gshape"));
			gdto.setGcolor(request.getParameter("gcolor"));
			gdto.setGimg1(fileName);
			gdto.setGinfo(request.getParameter("ginfo"));
			gdto.setPrice(request.getParameter("price"));
			gdto.setPieces(Integer.parseInt(request.getParameter("pieces")));
			
			goodsService.goodsInsert(gdto);
		}

		return "redirect:goodsList.do";
	}
	
	//상품 수정하기
	@RequestMapping(value="goodsUpdate.do", method = RequestMethod.POST )
	public String goodsUpdate(MultipartFile gimg1,MultipartFile gimg2, HttpServletRequest request, Model model) throws Exception {
		if(!gimg1.isEmpty() && !gimg2.isEmpty()) {
		String uploadFolder = "D:\\LIM\\jsp3\\web05\\src\\main\\webapp\\resources\\upload";
		String fileName = gimg1.getOriginalFilename();
		String fileName2 = gimg2.getOriginalFilename();
		File saveFile = new File(uploadFolder, fileName);
		File saveFile2 = new File(uploadFolder, fileName2);
		gimg1.transferTo(saveFile);
		gimg2.transferTo(saveFile2);
		GoodsDTO gdto = new GoodsDTO();
		gdto.setGno(Integer.parseInt(request.getParameter("gno")));
		gdto.setGname(request.getParameter("gname"));
		gdto.setGtype(request.getParameter("gtype"));
		gdto.setGshape(request.getParameter("gshape"));
		gdto.setGcolor(request.getParameter("gcolor"));
		gdto.setGimg1(fileName);
		gdto.setGimg2(fileName2);
		gdto.setGinfo(request.getParameter("ginfo"));
		gdto.setPrice(request.getParameter("price"));
		gdto.setPieces(Integer.parseInt(request.getParameter("pieces")));
		
		goodsService.goodsUpdate(gdto);
	}else if(gimg1.isEmpty()) {
		String uploadFolder = "D:\\LIM\\jsp3\\web05\\src\\main\\webapp\\resources\\upload";
		String fileName2 = gimg2.getOriginalFilename();
		File saveFile2 = new File(uploadFolder, fileName2);
		gimg2.transferTo(saveFile2);
		GoodsDTO gdto = new GoodsDTO();
		gdto.setGno(Integer.parseInt(request.getParameter("gno")));
		gdto.setGname(request.getParameter("gname"));
		gdto.setGtype(request.getParameter("gtype"));
		gdto.setGshape(request.getParameter("gshape"));
		gdto.setGcolor(request.getParameter("gcolor"));
		gdto.setGimg1(request.getParameter("gimg1"));
		gdto.setGimg2(fileName2);
		gdto.setGinfo(request.getParameter("ginfo"));
		gdto.setPrice(request.getParameter("price"));
		gdto.setPieces(Integer.parseInt(request.getParameter("pieces")));

		goodsService.goodsUpdate(gdto);
	}else if(gimg2.isEmpty()) {
		String uploadFolder = "D:\\LIM\\jsp3\\web05\\src\\main\\webapp\\resources\\upload";
		String fileName = gimg1.getOriginalFilename();
		File saveFile = new File(uploadFolder, fileName);
		gimg1.transferTo(saveFile);
		GoodsDTO gdto = new GoodsDTO();
		gdto.setGno(Integer.parseInt(request.getParameter("gno")));
		gdto.setGname(request.getParameter("gname"));
		gdto.setGtype(request.getParameter("gtype"));
		gdto.setGshape(request.getParameter("gshape"));
		gdto.setGcolor(request.getParameter("gcolor"));
		gdto.setGimg1(fileName);
		gdto.setGimg2(request.getParameter("gimg2"));
		gdto.setGinfo(request.getParameter("ginfo"));
		gdto.setPrice(request.getParameter("price"));
		gdto.setPieces(Integer.parseInt(request.getParameter("pieces")));

		goodsService.goodsUpdate(gdto);
	} else {
		GoodsDTO gdto = new GoodsDTO();
		gdto.setGno(Integer.parseInt(request.getParameter("gno")));
		gdto.setGname(request.getParameter("gname"));
		gdto.setGtype(request.getParameter("gtype"));
		gdto.setGshape(request.getParameter("gshape"));
		gdto.setGcolor(request.getParameter("gcolor"));
		gdto.setGinfo(request.getParameter("ginfo"));
		gdto.setPrice(request.getParameter("price"));
		gdto.setPieces(Integer.parseInt(request.getParameter("pieces")));
		goodsService.goodsEidt(gdto);
	}
		return "redirect:goodsList.do";
	}
	
	//상품수정폼
	@RequestMapping(value="edit.do" ,method= RequestMethod.GET )
	public String goodsEdit(@RequestParam int gno, Model model ) throws Exception {
		GoodsDTO goods = goodsService.goodsDetail(gno);
		model.addAttribute("goods", goods);
		return "admin/goodsEdit";
	}
	
	
	//상품 삭제
	@RequestMapping(value="goodsDelete.do", method = RequestMethod.GET)
	public String goodsDelete(@RequestParam int gno ,Model model ) throws Exception {
		goodsService.goodsDelete(gno);
		return "redirect:goodsList.do";
	}
	
  	//관리자용 상품 상세보기
	@RequestMapping(value="goodsDetail.do" ,method= RequestMethod.GET )
	public String goodsDetail(@RequestParam int gno, Model model ) throws Exception {
		GoodsDTO goods = goodsService.goodsDetail(gno);
		model.addAttribute("goods", goods);
		return "admin/goodsDetailAdmin";
	}
	
	/*게시판*/
	//게시판목록
	@RequestMapping("boardList.do")
	public String boardList(Model model) throws Exception {
		List<BoardDTO> boardList = boardService.boardList();
		model.addAttribute("boardList", boardList);
		return "admin/boardList";
	}
	//게시판 상세보기
	@RequestMapping(value="boardRead.do", method = RequestMethod.GET )
	public String boardRead(@RequestParam int seq, Model model) throws Exception {
		BoardDTO board = boardService.boardRead(seq);
		model.addAttribute("board", board);
		boardService.boardCheck(seq);		//조회수+1
		return "admin/boardRead";
	}
	//게시판 작성 폼
	@RequestMapping(value="write_from.do" )
	public String boardWriteForm(Model model) throws Exception {
		return "admin/boardWriteFrom";
	}
	
	//게시판 추가
	@RequestMapping(value="boardInsert.do",method = RequestMethod.POST)
	public String boardInsert(BoardDTO bdto, Model model) throws Exception {
		boardService.boardInsert(bdto);
		return "board/boardList";
	}
	
	//게시판 수정 폼
	@RequestMapping(value="boardEdit.do", method = RequestMethod.GET )
	public String boardEdit(@RequestParam int seq, Model model) throws Exception {
		BoardDTO board = boardService.boardRead(seq);
		model.addAttribute("board", board);
		return "admin/boardEdit";
	}
	
	//게시판 수정
	@RequestMapping(value="boardUpdate.do", method = RequestMethod.POST)
	public String boardUpdate(BoardDTO bdto, Model model) throws Exception {
		boardService.boardUpdate(bdto);
		return "redirect:boardRead.do?seq="+bdto.getSeq();
	}
	//게시판 삭제
	@RequestMapping(value="boardDelete.do", method = RequestMethod.GET)
	public String boardDelete(@RequestParam int seq, Model model) throws Exception {
		boardService.boardDelete(seq);
		return "redirect:boardList.do";
	}
	
	/*공지*/
		
	//페이지메이커를 활용한 페이지 분리하기 목록	//curPage->현재페이지
	@RequestMapping(value="noticePageList.do", method = RequestMethod.GET)
	 public String noticePageList(@RequestParam("curPage") int curPage, Model model) throws Exception {
		int cnt = noticeService.noticeCount();
		//PageMaker page = new PageMaker(cnt, curPage);
		//PageMaker page = new PageMaker(cnt, curPage, 10);
		PageMaker page = new PageMaker(cnt, curPage, 5, 10);
		List<NoticeDTO> noticePageList = noticeService.noticePageList(page);
		model.addAttribute("noticePageList", noticePageList);
		model.addAttribute("page", page);
		model.addAttribute("cnt", cnt);
        return "admin/noticePageList";
    }
	
	//공지 상세보기
	@RequestMapping(value="noticeRead.do", method = RequestMethod.GET)
    public String noticeRead(@RequestParam("seq") int seq, Model model) throws Exception {
		NoticeDTO notice = noticeService.noticeRead(seq);
		model.addAttribute("notice", notice);
        return "admin/noticeRead";
	}
	
	 //ckeditor 공지사항 폼 호출 
	@RequestMapping(value="addSmartNoticeForm.do", method = RequestMethod.GET)
    public String addNoticeSmartForm(Model model) throws Exception {
        return "admin/addSmartNoticeForm";
    }
	
	 //ckeditor를 활용한 글쓰기 처리 
	@RequestMapping(value="addSmartNotice.do", method = RequestMethod.POST)
	public String addSmartNotice(NoticeDTO ndto, Model model) throws Exception {
		noticeService.noticeInsert(ndto);
       return "redirect:/admin/noticePageList.do?curPage="+1;
   }
	
	//공지수정폼
	@RequestMapping(value="noticeEdit.do", method = RequestMethod.GET)
    public String noticeEdit(@RequestParam("seq") int seq, Model model) throws Exception {
		NoticeDTO notice = noticeService.noticeRead(seq);
		model.addAttribute("notice", notice);
        return "admin/noticeEdit";
	}
	
	//공지 수정
	@RequestMapping(value="noticeUpdate.do", method = RequestMethod.POST)
    public String noticeUpdate(NoticeDTO ndto, Model model) throws Exception {
		noticeService.noticeUpdate(ndto);
		return "redirect:/admin/noticePageList.do?curPage="+1;
    }
		
	//공지 삭제
	@RequestMapping(value="noticeDelete.do" ,method = RequestMethod.GET)
	public String noticeDelete(@RequestParam int seq, Model model) throws Exception {
		noticeService.noticeDelete(seq);
		return "redirect:/admin/noticePageList.do?curPage="+1;
	}
	
	/*리뷰*/
	//전체 리뷰 보기
	@RequestMapping("reviewAllList.do")
	public String reviewAllList (Model model) throws Exception {
		List<ReviewDTO> reviewAllList = reviewService.reviewAllList();
		model.addAttribute("reviewAllList", reviewAllList);
		return "admin/reviewAllList";
	}

	
	/*답글*/
	/*
	//답글 보기
	@RequestMapping(value="replyRead.do" ,method = RequestMethod.GET)
	public String replyRead(ReviewDTO rdto, Model model) throws Exception {
		ReviewDTO reply = reviewService.replyRead(rdto);
		model.addAttribute("reply", reply);
		return"review/reviewRead";
	}
	*/
	//답글 추가
	@RequestMapping(value="replyAdd.do",method = RequestMethod.POST )
	public String replyAdd(ReviewDTO rdto, Model model) throws Exception {
		reviewService.replyAdd(rdto);
		return"redirect:reviewAllList.do";
	}
	
	//답글 폼
	@RequestMapping(value="replyForm.do",method = RequestMethod.GET)
	public String replyForm (ReviewDTO rdto,Model model) throws Exception {
		ReviewDTO review = reviewService.reviewRead(rdto);
		model.addAttribute("review", review);
		return "admin/replyForm";
	}
	
	//답글수정
	@RequestMapping(value="replyUpdate.do",method = RequestMethod.POST)
	public String replyUpdate(ReviewDTO rdto, Model model) throws Exception {
		reviewService.replyUpdate(rdto);
		return"redirect:reviewAllList.do";
	}
	
	//답글 수정폼
	@RequestMapping(value="replyUpdateForm.do",method = RequestMethod.GET)
	public String replyUpdateForm (ReviewDTO rdto,Model model) throws Exception {
		ReviewDTO review = reviewService.reviewRead(rdto);
		model.addAttribute("review", review);
		return "admin/replyUpdateForm";
	}
	
}