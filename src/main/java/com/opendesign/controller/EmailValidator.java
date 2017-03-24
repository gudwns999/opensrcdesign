package com.opendesign.controller;

import org.springframework.validation.Errors;
import org.springframework.validation.Validator;

import com.opendesign.vo.MailVO;

public class EmailValidator implements Validator{
	@Override
	public boolean supports(Class<?> arg0){
		return MailVO.class.isAssignableFrom(arg0);
	}
	@Override
	public void validate(Object obj, Errors errors){
		MailVO vo = (MailVO)obj;
		
		String email = vo.getEmail_address();
		String naame = vo.getFull_name();
		if(naame ==null||naame.trim().isEmpty()){
			errors.rejectValue("name","trouble");
		}
	}
}