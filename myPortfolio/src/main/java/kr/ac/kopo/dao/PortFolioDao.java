package kr.ac.kopo.dao;

import java.util.List;

import kr.ac.kopo.model.Board;
import kr.ac.kopo.utill.Pager;

public interface PortFolioDao {
	//포트폴리오 리스트
	List<Board> list(Pager pager);
	//포트폴리오 등록
	void add(Board board);
	//포트폴리오 상세보기
	Board view(int bNo);
	//포트폴리오 수정
	void update(Board board);
	//포트폴리오 삭제 
	void delete(Board board);
	//전체 게시글 수 구하기
	int total(Pager pager);
	//파일등록
	void uploadFile(Board bFile);
	//최근 등록된 게시글 번호
	int maxBno();
	//첨부파일 리스트
	List<Board> fileList(int bNo);

}
