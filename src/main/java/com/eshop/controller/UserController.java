package com.eshop.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.eshop.dto.UserDTO;
import com.eshop.util.Code;
import com.eshop.util.UserValidator;

@Controller
@RequestMapping("/user/")
public class UserController {

	//modelAttribute가 user인 객체가 넘어 오면, 객체로 전환시킴
	@ModelAttribute("user")
	protected Object formBack() throws Exception {
		return new UserDTO();
	}

	@RequestMapping(value="exjoin.do")
	public String form(Model model) {
		refData(model);
		return "user/joinForm";
	}
	
	//select 태그, input[type=checkbox] 태그, input[type=radio] 태그 값이 들어 오면,
	//그에 해당 하는 값을 치환시켜 view(jsp파일)에 바인딩 해줌
	public void refData(Model model) {
		List<Code> jCodes = new ArrayList<Code>();
		jCodes.add(new Code("001", "프로그래머"));
		jCodes.add(new Code("002", "디자이너"));
		jCodes.add(new Code("003", "기획자"));
		jCodes.add(new Code("004", "매니저"));
		jCodes.add(new Code("005", "테스터"));
		
		String[] hobbyNames = {"독서", "여행", "등산", "영화감상"};
		String[] gender = {"남성","여성"};
		
		model.addAttribute("jobCodes", jCodes);
		model.addAttribute("hobbyNames", hobbyNames);
		model.addAttribute("gender", gender);
	}
	
	@RequestMapping(value="ok.do", method=RequestMethod.POST)
	public String submit(@ModelAttribute UserDTO user, BindingResult result, Model model) {
		new UserValidator().validate(user, result);
		if(result.hasErrors()) {
			refData(model);
			return "user/joinForm";
		}
		
		model.addAttribute("user", user);
		return "user/joinOk";
	}
}