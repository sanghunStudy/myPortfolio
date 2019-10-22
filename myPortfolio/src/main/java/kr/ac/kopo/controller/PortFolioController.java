package kr.ac.kopo.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.Errors;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.ac.kopo.model.Board;
import kr.ac.kopo.model.FileUpload;
import kr.ac.kopo.service.PortFolioService;
import kr.ac.kopo.utill.FileDown;
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
	public @ResponseBody List<String> upload(@ModelAttribute FileUpload uploadForm, int savePoint, Board board) {
		List<String> resultMsg = service.uploadFile(uploadForm,savePoint,board);
		return resultMsg;
	}
	
	//파일삭제
	@RequestMapping( value= "/fileDel", method = RequestMethod.POST )
	public @ResponseBody List<String> fileDel(String delName,int fNo) {
		List<String> resultMsg = service.fileDel(delName,fNo);
		return resultMsg;
	}
	//파일 다운로드
	@RequestMapping("/downLoad")
	public void fileDown(int fNo,HttpServletRequest req,HttpServletResponse res) {
	    try {
	    	Board fileVo = service.selectFile(fNo);
	    	FileDown down = new FileDown();
	    	down.fileDown(req, res, fileVo.getfDir(), fileVo.getfPName(), fileVo.getfOName());
	    	
	     } catch (Exception e) {
	         e.printStackTrace();
	     }
	}
	
	@RequestMapping("/fileListDel")
	public void fileListDel() {
		service.fileListDel();
	}
	//포트폴리오 작성 화면
	@RequestMapping(value="/add", method = RequestMethod.GET)
	public String portFolioAdd(Model model, int bNo) {
		Board vo = new Board();
		if(bNo != 0) {
			vo = service.view(bNo);
			List<Board> fileList = service.fileList(bNo);
			model.addAttribute("fileList", fileList);
			model.addAttribute("vo",vo);	
		}else {
			vo.setbNo(0);
			model.addAttribute("vo",vo);	
		}
		
		return path+"add";
	}
	
	
	//포티폴리오 작성처리
	@RequestMapping(value="/add", method = RequestMethod.POST)
	@ResponseBody
	public  String portFolioAdd(Model model,@Valid Board board,HttpSession session,Errors errors) {
		if(errors.hasErrors()) {
			return path+"add";
		}else {
			board.setUserId(session.getAttribute("user").toString());
			//수정일때
			if(board.getbNo() != 0) {
				service.update(board);
			}else {
				service.add(board);	
			}
			return "ok";
		}
		
//		return "ok";
	}
	//포트폴리오 상세보기
	@RequestMapping(value="/view", method = RequestMethod.GET)
	public String portFolioView(Model model, int bNo) {
		
		Board viewItem = service.view(bNo);
		model.addAttribute("viewItem", viewItem);
		List<Board> fileList = service.fileList(bNo);
		model.addAttribute("fileList", fileList);
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
	public String portFolioUpdate(Board board,HttpSession session) {
		board.setbUpdateWriter(session.getAttribute("user").toString());//세션의 아이디값 넣어줘야함
		service.update(board);
		return "redirect:list";
	}
	//포트폴리오 삭제
	@RequestMapping(value="/delete", method = RequestMethod.GET)
	public String portFolioDelete(Board board,HttpSession session) {
		board.setUserId(session.getAttribute("user").toString());//세션의 아이디값 넣어줘야함
		service.delete(board);
		return "redirect:list";
	}
}
