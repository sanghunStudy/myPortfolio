package kr.ac.kopo.service;

import java.util.List;

import kr.ac.kopo.model.Board;
import kr.ac.kopo.model.FileUpload;
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
	//가공데이터 삭제
	void init();
	//가공데이터 생성
	void dummy();
	
	List<String> uploadFile(FileUpload uploadForm, int savePoint);

}
