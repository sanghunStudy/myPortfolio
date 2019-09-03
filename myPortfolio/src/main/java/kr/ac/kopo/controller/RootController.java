package kr.ac.kopo.controller;

import javax.servlet.http.HttpServletRequest;
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
	String login(HttpServletRequest req) {
		
		String referer = req.getHeader("Referer");//이전 페이지에 대한 정보가 들어있는 헤더
		req.getSession().setAttribute("redirectURI", referer);//가져온 uri를 세션에 저장
		
		return "login";
	}
	
	@RequestMapping(value="/login", method=RequestMethod.POST)
	String login(String id, String pw, HttpSession session) {
		String backUri = (String)session.getAttribute("redirectURI");//get에서 저장한 uri를 가져다 사용한다.
		if(id.equals("user") && pw.equals("1234")) {
			session.setAttribute("user", id);
			return "redirect:"+backUri;// 로그인 성공시 이전 페이지로 이동시켜준다.
		}
		return "redirect:/";
	}
	
	@RequestMapping("/logout")
	String logout(HttpSession session) {
		session.invalidate();
		return "redirect:/";
	}
}
