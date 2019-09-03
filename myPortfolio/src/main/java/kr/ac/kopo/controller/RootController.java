package kr.ac.kopo.controller;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class RootController {

	@RequestMapping("/")
	public String index() {
		return "index";
	}

	@RequestMapping(value="/login", method=RequestMethod.GET)
	String login() {
		
		return "login";
	}
	
	@RequestMapping(value="/login", method=RequestMethod.POST)
	String login(String id, String pw, HttpSession session) {
		if(id.equals("user") && pw.equals("1234")) {
			session.setAttribute("user", id);
		}
		return "redirect:/";
	}
	
	@RequestMapping("/logout")
	String logout(HttpSession session) {
		session.invalidate();
		return "redirect:/";
	}
}
