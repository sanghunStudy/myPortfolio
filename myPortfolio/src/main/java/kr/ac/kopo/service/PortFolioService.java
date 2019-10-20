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
	//파일업로드
	List<String> uploadFile(FileUpload uploadForm, int savePoint);
	//첨부파일 리스트
	List<Board> fileList(int bNo);
	//첨부파일 삭제
	List<String> fileDel(String fileDel);
	//첨부파일 단일 조회
	Board selectFile(int fNo);
	//첨부파일 리스트 삭제
	void fileListDel();

}
