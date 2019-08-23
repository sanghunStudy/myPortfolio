package kr.ac.kopo.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.ac.kopo.model.Board;

@Repository
public class PortFolioDaoImpl implements PortFolioDao {

	@Autowired
	SqlSession sql;
	
	//포트폴리오 리스트 출력
	@Override
	public List<Board> list() {
		return sql.selectList("board.list");
	}

	//포트폴리오 등록
	@Override
	public void add(Board board) {
		sql.insert("board.add", board);
	}
	//포트폴리오 상세보기
	@Override
	public Board view(int bNo) {
			sql.update("board.viewCount",bNo);
		return sql.selectOne("board.view",bNo);
	}
	//포트폴리오 수정
	@Override
	public void update(Board board) {
		sql.update("board.update", board);
	}
	//포트폴리오 삭제
	@Override
	public void delete(Board board) {
		sql.update("board.delete", board);
	}

}
