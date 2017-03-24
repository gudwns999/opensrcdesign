package com.opendesign.controller;

import java.util.Locale;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class testController {
	@RequestMapping("/loginForm.do")
	public ModelAndView main(HttpServletRequest request) {
		return new ModelAndView("loginForm");
	}
	@RequestMapping("/login.do")
	public String login(Locale locale, Model model){
		return "login";
	}
}