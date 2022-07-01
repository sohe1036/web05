package com.eshop.util;

import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;

import com.eshop.dto.UserDTO;

public class UserValidator implements Validator {

	@Override
	public boolean supports(Class<?> clazz) {
		return UserDTO.class.isAssignableFrom(clazz);
	}

	@Override
	public void validate(Object object, Errors errors) {
		UserDTO user = (UserDTO) object;
		String defaultMsg= "필수입력사항입니다.";
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "id", "required", "아이디 값이 비어있거나 형식과 일치하지 않습니다.");
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "email","required", "이메일 값이 비어있거나 형식과 일치하지 않습니다.");
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "address.address1","required", "주소1 값이 비어있거나 형식과 일치하지 않습니다.");
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "address.address2","required", "주소2 값이 비어있거나 형식과 일치하지 않습니다.");
		
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "job","required", defaultMsg);
		
		if(user.getGender()==null || user.getGender().length == 0) {
			errors.rejectValue("gender", "select");
		}
		
		if(user.getName().length()<2 || user.getName().length() >12 ) {
			errors.rejectValue("name", "lengthsize", "이름은 2~12자 사이어야합니다");
		}
	}
	
}
