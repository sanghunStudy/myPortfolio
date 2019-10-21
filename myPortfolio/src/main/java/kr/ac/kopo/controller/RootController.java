package kr.ac.kopo.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import kr.ac.kopo.utill.PrintAlert;

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
		
		System.out.print(referer+"<<<");
		
		return "login";
	}
	
	@RequestMapping(value="/login", method=RequestMethod.POST)
	void login(String id, String pw,HttpServletRequest request,HttpServletResponse response, HttpSession session) throws IOException {
//		String backUri = (String)session.getAttribute("redirectURI");//get에서 저장한 uri를 가져다 사용한다.
//		"redirect:"+backUri; 로그인 성공시 이전 페이지로 이동시켜준다.
			if(id.equals("user") && pw.equals("1234")) {
				session.setAttribute("user", id);
				PrintAlert.printAlert("로그인이 완료 되었습니다.", request, response);
//				return "redirect:/";
				// 
			}else {
				PrintAlert.printAlert("아이디와 비밀번호를 확인해주세요", request, response);
//				return "redirect:/";
			}
	}
	
	@RequestMapping("/logout")
	String logout(HttpSession session) {
		session.invalidate();
		return "redirect:/";
	}
}
