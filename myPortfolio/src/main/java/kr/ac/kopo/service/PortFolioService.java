package kr.ac.kopo.service;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import kr.ac.kopo.model.Board;
import kr.ac.kopo.utill.Pager;

public interface PortFolioService {
	//포트폴리오 목록
	List<Board> list(Pager pager);
	//포트폴리오 등록
	void add(Board board);
	//포트폴리오 상세보기
	Board view(int bNo);
	//포트폴리오 수정
	void update(Board board);
	//포트폴리오 삭제
	void delete(Board board);
	//ck에디터 이미지 업로드
	void imgUp(HttpServletRequest request, HttpServletResponse response, MultipartFile upload);
	//가공데이터 삭제
	void init();
	//가공데이터 생성
	void dummy();
	
	List<Board> fileUp(Board board);
	
	String restore(ArrayList<MultipartFile> files);

}
