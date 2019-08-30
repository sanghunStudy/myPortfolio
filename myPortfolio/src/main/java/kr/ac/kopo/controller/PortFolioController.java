package kr.ac.kopo.controller;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.multipart.commons.CommonsMultipartFile;

import kr.ac.kopo.model.Board;
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
	
	
//	drag and drop 을 하기위한 메서드(CKEditorFuncNum 못 받아서 오류남)
	@RequestMapping(value = "/drag", method = RequestMethod.POST,produces = "text/html;charset=UTF-8")
	@ResponseBody
	public String uploadDragDrop(@RequestParam(value="CKEditorFuncNum", required=false) String funcNumber, HttpServletRequest request,MultipartFile upload){
		OutputStream out = null;
        PrintWriter printWriter = null;
		logger.info("drag 메서드 실행 확인");
		
		String fileName= upload.getOriginalFilename();
		logger.info("fileName = "+ fileName);
		String fnNum = request.getParameter("CKEditorFuncNum");
		logger.info(fnNum+ "fnNum");
		
//		CommonsMultipartFile multipartFile = (CommonsMultipartFile) request.getFile(fileName);
//		logger.info("multipartFile = "+ multipartFile);
		
		String url;
	    try {
	        byte[] bytes = upload.getBytes();
	        
	        String storedFileLocation = "D:\\img\\";
	        
	        out = new FileOutputStream(new File(storedFileLocation + fileName));
	        out.write(bytes);
	        // Create the file on server
//	        File serverFile = new File(storedFileLocation);
//	        BufferedOutputStream stream = new BufferedOutputStream(
//	                new FileOutputStream(serverFile));
//	        stream.write(bytes);
//	        stream.close();
	        
//	        logger.info("Server File Location=" + serverFile.getAbsolutePath());
//	    	String callback = request.getParameter("CKEditorFuncNum");
	    	int callback = 1;
	        url = request.getContextPath() + "/img/" + fileName;
	        
		
			/*
			 * return
			 * "<script type='text/javascript'>window.parent.CKEDITOR.tools.callFunction(" +
			 * callback + ",'" + url + "','이미지를 업로드 하였습니다.'" + ")</script>";
			 */	        
	        return "{'filename' : "+fileName+", 'uploaded' : 1, 'url':" +url+"}";

	        		
	        
			/*
			 * return
			 * "<script type=\"text/javascript\">window.parent.CKEDITOR.tools.callFunction("
			 * +callback+ ",\""+url+"\", \"\");</script>";
			 */	    
	        } catch (Exception e) {
	        	return "You failed to upload " + fileName + " => " + e.getMessage();
	        }
	}

	
	//ckeditor 이미지 업로드 처리를 위한 메서드
	@RequestMapping(value="/imgUp" , method = RequestMethod.POST)
	public void imgUp(HttpServletRequest request, HttpServletResponse response, @RequestParam MultipartFile upload){
		//이미지 저장, 불러오기, 업로드를 위해 매개변수 3가지 선언해준다.
		service.imgUp(request,response,upload);
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
