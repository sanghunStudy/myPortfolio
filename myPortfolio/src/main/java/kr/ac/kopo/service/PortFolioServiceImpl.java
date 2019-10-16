package kr.ac.kopo.service;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import kr.ac.kopo.dao.PortFolioDao;
import kr.ac.kopo.model.Board;
import kr.ac.kopo.utill.Pager;

@Service
public class PortFolioServiceImpl implements PortFolioService {

	@Autowired
	PortFolioDao dao;
	
	//포트폴리오 목록
	@Override
	public List<Board> list(Pager pager) {
		//전체 게시물을 구해서 변수에 담아준다.
		int total = dao.total(pager);
		//Pager 클래스의 total에 위에서 담은 값을 셋팅
		pager.setTotal(total);
		
		return dao.list(pager);
	}
	//포트폴리오 등록
	@Override
	public void add(Board board) {
		dao.add(board);
	}
	//포트폴리오 상세보기
	@Override
	public Board view(int bNo) {
		return dao.view(bNo);
	}
	//포트폴리오 수정
	@Override
	public void update(Board board) {
		dao.update(board);
	}
	//포트폴리오 삭제
	@Override
	public void delete(Board board) {
		dao.delete(board);
	}
	
	//ck에디터 이미지 업로드 처리부분
	@Override
	public void imgUp(HttpServletRequest request, HttpServletResponse response, MultipartFile upload) {
		OutputStream out = null;
        PrintWriter printWriter = null;
		//문자타입설정
		response.setCharacterEncoding("utf-8");
		//파라미터로 전달되는 response 객체의 한글설정
		response.setContentType("text/html; charset=utf-8");
		
		try {
			//업로드한 이름
			String fileName = upload.getOriginalFilename();
			//파일을 바이트 배열로 변환시킨다.
			byte[] bytes = upload.getBytes();
			//이미지 업로드할 경로(배포디렉토리로 설정)
//			String uploadPath = "D:\\workspace-spring\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp1\\wtpwebapps\\myPortfolio\\WEB-INF\\views\\images\\";
			String uploadPath = "C:\\img\\";
			out = new FileOutputStream(new File(uploadPath + fileName));
	
			//write메소드의 인수로 파일의 총 바이트를 준다.
			//지정된 바이트를 출력하기 위해 사용한다.
			out.write(bytes);
			
			//클라이언트에 결과를 표시해준다.
			String callback = request.getParameter("CKEditorFuncNum");
			
			//서버에서 클라이언트로 텍스트를 전송한다.(자바스크립트를 실행시킨다.)
			printWriter = response.getWriter();
			//파일url 경로 (출력하는 경로) servlet-context.xml에서 저장 경로를 img로 맵핑한 후 여기서 가져오도록 했다.
			String fileUrl = request.getContextPath() + "/img/" + fileName;
			//화면에 출력
			printWriter.println("<script>window.parent.CKEDITOR.tools.callFunction(" + callback + ",'" + fileUrl + "','이미지가 업로드되었습니다 !')" + "</script>");
			//flush 메서드를 호출하면 buffer의 내용이 파일에 쓰여준다.
			printWriter.flush();
		}catch(IOException e) {
			e.printStackTrace();
		}finally {
			try {
				if(out != null) {
					out.close();
				}
				if(printWriter != null) {
					printWriter.close();
				}
			}catch (IOException e) {
				e.printStackTrace();
			}//finally 내부 try catch 끝
		}//finally 끝
	}//imgUp 끝
	
	//가공데이터 삭제
	@Override
	public void init() {
		//반복문을 사용하여 아래에서 내가 만든만큼의 가공 데이터를 삭제한다.
		for(int i= 17; i<100; i++) {
			//board 객체 생성하여 최근수정자를 셋팅하고 삭제할 글 번호를 입력(i) 반복하여 delete 메서드 실행.
			//데이터를 실제로 삭제하는게 아니라 상태만 update를 하기 때문에 board 객체를 사용하여 전달했다.
			Board board = new Board();
			board.setbUpdateWriter("관리자");
			board.setbNo(i);
			dao.delete(board);
		}
		
		//실제 삭제가 아니라 상태 변경이기 때문에 db에 값은 그대로 남아있다.
//		다시 살리고 싶으면 아래 쿼리로 update 해준다.
		/*
		 * update board set b_delete = 'N' where b_no between 17 and 99;
		 */	
		}
	
	//가공데이터 생성
	@Override
	public void dummy() {
		//반복문을 사용하여 내가 원하는 값만큼 가공데이터를 생성한다.
		for(int i=17; i<100; i++) {
			//Board 객체 생성하여 원하는 값 셋팅 후 add메서드 반복 호출로 db에 값 생성
			Board board = new Board();
			board.setbTitle(i+"번째 테스트");
			board.setbContents(i+"번째 테스트");
			board.setbWriter("배상훈");
			dao.add(board);
		}
		
	}

}
