package kr.ac.kopo.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import kr.ac.kopo.model.Board;
import kr.ac.kopo.service.PortFolioService;

@RequestMapping("/portFolio")
@Controller
public class PortFolioController {

	final String path = "portFolio/";
	@Autowired
	PortFolioService service;
	//포트폴리오 리스트
	@RequestMapping("/list")
	public String list(Model model) {
		List<Board> list =  service.list();
		model.addAttribute("list", list);
		return path+"list";
	}
	//포트폴리오 작성 화면
	@RequestMapping(value="/add", method = RequestMethod.GET)
	public String portFolioAdd() {
		return path+"add";
	}
	//포티폴리오 입력 화면
	@RequestMapping(value="/add", method = RequestMethod.POST)
	public String portFolioAdd(Board board) {
		service.add(board);
		return "redirect:list";
	}
	//포트폴리오 상세보기
	@RequestMapping(value="/view", method = RequestMethod.GET)
	public String portFolioView(Model model, int bNo) {
		
		Board viewItem = service.view(bNo);
		
		model.addAttribute("viewItem", viewItem);
		return path+"view";
	}
	//포트폴리오 수정화면
	@RequestMapping(value="/update", method = RequestMethod.GET)
	public String portFolioUpdate(Model model, int bNo) {
		
		Board updateItem = service.view(bNo);
		
		model.addAttribute("updateItem", updateItem);
		return path+"update";
	}
	//포트폴리오 수정처리
	@RequestMapping(value="/update", method = RequestMethod.POST)
	public String portFolioUpdate(Board board) {
		board.setbUpdateWriter("test222");//세션의 아이디값 넣어줘야함
		service.update(board);
		return "redirect:list";
	}
	//포트폴리오 삭제
	@RequestMapping(value="/delete", method = RequestMethod.GET)
	public String portFolioDelete(Board board) {
		board.setbUpdateWriter("test222");//세션의 아이디값 넣어줘야함
		service.delete(board);
		return path+"list";
	}
}
