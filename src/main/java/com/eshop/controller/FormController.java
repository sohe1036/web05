package com.eshop.controller;

import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.eshop.dto.FormDTO;

@Controller
public class FormController {
	
	@RequestMapping(value="/save")
	public String formSave(@ModelAttribute FormDTO member, BindingResult result) {
		//System.out.println("이름 : "+member.getName());
		//System.out.println("아이디 : "+member.getId());
		//System.out.println("비밀번호 : "+member.getPwd());
		//System.out.println("이메일 : "+member.getEmail());
		return "redirect:/input";
	}
	
	@RequestMapping(value="/input")
	public ModelAndView formInput() {
		return new ModelAndView("testForm", "formDTO" , new FormDTO());	//뷰이름, 모델어튜리뷰트나 코멘드이름,객체
	}
}
