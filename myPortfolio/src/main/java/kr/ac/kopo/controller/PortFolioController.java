package kr.ac.kopo.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import kr.ac.kopo.model.Board;
import kr.ac.kopo.model.FileUpload;
import kr.ac.kopo.service.PortFolioService;
import kr.ac.kopo.utill.Pager;

@RequestMapping("/portFolio")
@Controller
public class PortFolioController {

	private static final Logger logger = LoggerFactory.getLogger(PortFolioController.class);
	final String path = "portFolio/";
	
	@Autowired
	PortFolioService service;
	
	
	//더미 데이터를 삭제하는 메서드
	@RequestMapping("/init")
	String init(Model model) {
		//가공데이터 삭제
		service.init();
		return "redirect:list";
	}
	
	//데이터를 한번에 자동으로 만들어주는 메서드
	@RequestMapping("/dummy")
	String dummy(Model model) {
		//가공데이터 생성
		service.dummy();
		return "redirect:list";
	}
	
	//포트폴리오 리스트
	@RequestMapping("/list")
	public String list(Pager pager, Model model) {
		//Board 클래스에 객체를 만들지 않고 바로 접근 getSearch 메서드는 static 메서드(정적 머세드이다.)
		pager.setSearch(Board.getSearch(pager.getSearchMode()));
		//Pager는 페이지 네이션을 위해 만든 클래스
		List<Board> list =  service.list(pager);
		model.addAttribute("list", list);
		return path+"list";
	}
	//파일업로드
	@RequestMapping( value= "/upload", method = RequestMethod.POST )
	public @ResponseBody List<String> upload(@ModelAttribute FileUpload uploadForm, int savePoint) {
		
		List<String> resultMsg = service.uploadFile(uploadForm,savePoint);
		return resultMsg;
	}
	//포트폴리오 작성 화면
	@RequestMapping(value="/add", method = RequestMethod.GET)
	public String portFolioAdd() {
		return path+"add";
	}
	//포티폴리오 작성처리
	@RequestMapping(value="/add", method = RequestMethod.POST)
	public String portFolioAdd(Board board) {
		board.setbWriter("user");
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
