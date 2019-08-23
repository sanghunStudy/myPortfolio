package kr.ac.kopo.service;

import java.util.List;

import kr.ac.kopo.model.Board;

public interface PortFolioService {
	//포트폴리오 목록
	List<Board> list();
	//포트폴리오 등록
	void add(Board board);
	//포트폴리오 상세보기
	Board view(int bNo);
	//포트폴리오 수정
	void update(Board board);
	//포트폴리오 삭제
	void delete(int bNo);

}
