package kr.ac.kopo.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.ac.kopo.dao.PortFolioDao;
import kr.ac.kopo.model.Board;

@Service
public class PortFolioServiceImpl implements PortFolioService {

	@Autowired
	PortFolioDao dao;
	
	//포트폴리오 목록
	@Override
	public List<Board> list() {
		return dao.list();
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

}
