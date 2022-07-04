package com.eshop.controller;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.eshop.dto.MemberDTO;
import com.eshop.service.MemberService;

@Controller
@RequestMapping("/member/*")
public class MemberController {
	
	@Autowired
	MemberService memberService;
	
	//세션
	@Autowired
	HttpSession session;

	//암호화
	@Inject
	BCryptPasswordEncoder pwdEncoder;
	
	//회원약관
	@RequestMapping("agree.do")
	public String agree(Model model) throws Exception {
		return "member/agree";
	}
	
	//회원목록
	@RequestMapping("list.do")
	public String memberList(Model model) throws Exception {
		List<MemberDTO> memberList = memberService.memberList();
		model.addAttribute("memberList", memberList);
		return "member/memberList";
	}
	//마이페이지
		
	//회원정보보기
	@RequestMapping(value="detail.do" ,method = RequestMethod.GET )
	public String memberDetail(@RequestParam String uid, Model model) throws Exception {
		MemberDTO member = memberService.memberDetail(uid);
		model.addAttribute("member", member);
		return "member/memberDetail";
	}
	
	//회원정보수정폼
	@RequestMapping(value="edit.do" ,method = RequestMethod.GET )
	public String memberEdit(@RequestParam String uid, Model model) throws Exception {
		MemberDTO member = memberService.memberDetail(uid);
		model.addAttribute("member", member);
		return "member/memberEdit";
	}
	
	//회원정보 수정
	@RequestMapping(value="update.do", method = RequestMethod.POST)
	public String memberUpdate(MemberDTO mdto, Model model) throws Exception {
		String upw = mdto.getUpw();		//DTO에 비밀번호를 가져와서
		String epw = pwdEncoder.encode(upw); //비밀번호 인코팅
		mdto.setUpw(epw);		//인코딩한 비밀번호를 다시 넣어줘
		memberService.memberUpdate(mdto);
		return "redirect:detail.do?uid="+mdto.getUid();
	}
	
	//회원탈퇴
	@RequestMapping(value="delete.do")
	public String memberDelete(@RequestParam String uid,Model model,HttpSession session) throws Exception {
		memberService.memberDelete(uid);
		session.invalidate();
		return "redirect:/";
	}
	
	//회원가입폼
	@RequestMapping("join.do")
	public String memberJoin(Model model) throws Exception {
		return "member/join";
	}
	
	//회원가입처리
	@RequestMapping(value="insert.do", method = RequestMethod.POST)
	public String memberWrite(MemberDTO mdto, Model model) throws Exception {
		String upw = mdto.getUpw();	//DTO에서 u_pw가져와
		String epw = pwdEncoder.encode(upw);	//가져온 u_pw를 인코팅해서 암호화
		mdto.setUpw(epw);		//인코딩한 epw를 다시 DTO의 u_pw에 세팅		
		memberService.memberInsert(mdto);
		return "redirect:loginForm.do";
	}
	
	//아이디 체크
	@RequestMapping (value="idCheck.do", method = RequestMethod.GET)
	public String idCheck(@RequestParam String uid, Model model, RedirectAttributes rttr) throws Exception {
		int cnt = memberService.idCheck(uid);
		
		if(cnt==0) { //일치하는 아이디 없음->사용가능
			model.addAttribute("msg", "사용 가능한 아이디입니다.");
			rttr.addFlashAttribute("message", "사용 가능한 아이디입니다.");
			model.addAttribute("ck", "yes");
			model.addAttribute("id", uid);
		} else {
			model.addAttribute("msg", "이미 사용중인 아이디입니다.");
			rttr.addFlashAttribute("message", "이미 사용중인 아이디입니다.");
			model.addAttribute("ck", null);
		}
		return "member/join";
	}
	
	//로그인폼
	@RequestMapping("loginForm.do")
	public String memberLoginForm(Model model) throws Exception {
		return "member/loginForm";
	}
	
	//로그인
	@RequestMapping(value="login.do", method = RequestMethod.POST)
	public String memberLogin(@RequestParam String uid, @RequestParam String upw, HttpServletRequest req, RedirectAttributes rttr) throws Exception {
		MemberDTO member = new MemberDTO();		//DTO선언
		member.setUid(uid);
		member.setUpw(upw);		//request된 아이디 패스워드입력값을 DTO에 주입
		MemberDTO login = memberService.login(member);
		boolean loginSuccess = pwdEncoder.matches(member.getUpw(), login.getUpw());	// 입력한 비밀번호값과 원래 DTO의 비밀번호값 매치해
		
		if(loginSuccess==true && login !=null) {
			session.setAttribute("member", login);
			session.setAttribute("sid", member.getUid());
			return "redirect:/";
		} else {
			session.setAttribute("member", null);
			return "redirect:loginForm.do";
		}
	}
	
	//로그아웃
	@RequestMapping("logout.do")
	public String memberLogout(HttpSession session) throws Exception {
		session.invalidate();
		return "redirect:/";
	}
	
	
}
