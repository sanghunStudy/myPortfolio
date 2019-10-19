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

	/**
	 * 파일리스트
	 * @param board
	 * @return int
	 */
	int fileInsert(Board board);
	
	/**
	 * 파일리스트
	 * @param board
	 * @return List<Board>
	 */
	List<Board> fileUp(Board board);

}
