package kr.ac.kopo.service;

import java.io.File;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import kr.ac.kopo.dao.PortFolioDao;
import kr.ac.kopo.model.Board;
import kr.ac.kopo.model.FileUpload;
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
			board.setbEtc(i+"번째 테스트");
			board.setbWriter("배상훈");
			dao.add(board);
		}
		
	}

	//첨부파일 파일 업로드
	@Override
	public List<String> uploadFile(FileUpload uploadForm, int savePoint) {
		//파일 목록 얻어오기
		List<MultipartFile> files = uploadForm.getFiles();
		List<String> fileNames = new ArrayList<String>();

		//저장버튼 클릭시 실제저장 아니면 이름만 화면출력..
		if(savePoint == 1) {
			//첨부파일 저장 경로
			String path = "C:\\portfolio\\";
			System.out.println(files.get(0).getOriginalFilename());
			if(null != files && files.size() > 0) {
				//파일 저장할 폴더 생성
				File fileDir = new File(path); 
				if (!fileDir.exists())
					fileDir.mkdirs();
				long time = System.currentTimeMillis(); 
				//파일있는만큼 전부 반복
				for (MultipartFile mf : files) {
					Board bFile = new Board();
					//원본 파일 명
					String originFileName = mf.getOriginalFilename(); 
					//저장할 파일명
					String saveFileName = String.format("%d_%s", time, originFileName); 
					try { // 파일생성 
						mf.transferTo(new File(path, saveFileName));
					} catch (Exception e) {
						e.printStackTrace();
					}
					//selectKey가 다른세션이라 그런지 먹히지 않아서 편법
					int bNo = dao.maxBno();
					
					bFile.setbNo(bNo);
					bFile.setfOName(originFileName);//원본 파일명
					bFile.setfPName(saveFileName);//실제 파일명
					bFile.setfVolume(Long.toString(mf.getSize()));//파일 크기
					bFile.setfDir(path);//파일 경로
					bFile.setfType(mf.getContentType());//파일 타입
					dao.uploadFile(bFile);
				}
				fileNames.add("ok");
				return fileNames;
			}else {
				fileNames.add("등록된 포트폴리오가 없습니다.");
				return fileNames;
			}
		}else {
			for (MultipartFile mf : files) {
				//파일명 출력
				String fileName = mf.getOriginalFilename();
				fileNames.add(fileName);
			}
			return fileNames;
		}

	}
	//첨부파일 리스트
	@Override
	public List<Board> fileList(int bNo) {
		return dao.fileList(bNo);
	}
}
