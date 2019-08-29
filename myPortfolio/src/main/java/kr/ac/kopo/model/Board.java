package kr.ac.kopo.model;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import kr.ac.kopo.controller.PortFolioController;

public class Board {
	int bNo;//게시글번호
	String bTitle;//제목
	String bWriter;//작성자
	String bContents;//내용
	String bDate;//작성일자
	int bViews;//조회수
	char bDelete;//삭제여부
	String bUpdateDate;//수정일자
	String bDeleteDate;//삭제일자
	String bUpdateWriter;//최종수정자
	
	private static final Logger logger = LoggerFactory.getLogger(Board.class);
	
	public int getbNo() {
		return bNo;
	}
	public void setbNo(int bNo) {
		this.bNo = bNo;
	}
	public String getbTitle() {
		return bTitle;
	}
	public void setbTitle(String bTitle) {
		this.bTitle = bTitle;
	}
	public String getbWriter() {
		return bWriter;
	}
	public void setbWriter(String bWriter) {
		this.bWriter = bWriter;
	}
	public String getbContents() {
		return bContents;
	}
	public void setbContents(String bContents) {
		this.bContents = bContents;
	}
	public String getbDate() {
		return bDate;
	}
	public void setbDate(String bDate) {
		this.bDate = bDate;
	}
	public int getbViews() {
		return bViews;
	}
	public void setbViews(int bViews) {
		this.bViews = bViews;
	}
	public char getbDelete() {
		return bDelete;
	}
	public void setbDelete(char bDelete) {
		this.bDelete = bDelete;
	}
	public String getbUpdateDate() {
		return bUpdateDate;
	}
	public void setbUpdateDate(String bUpdateDate) {
		this.bUpdateDate = bUpdateDate;
	}
	public String getbDeleteDate() {
		return bDeleteDate;
	}
	public void setbDeleteDate(String bDeleteDate) {
		this.bDeleteDate = bDeleteDate;
	}
	public String getbUpdateWriter() {
		return bUpdateWriter;
	}
	public void setbUpdateWriter(String bUpdateWriter) {
		this.bUpdateWriter = bUpdateWriter;
	}
	
	//sql 인젝션을 방지하기 위해 jsp에서 1,2,3 이런식으로 값을 주고 해당 값에 대응하는 컬럼을 셋팅 해준다.
	//여기서 리턴된 값이 Pager 클래스의 setSearch에 들어가게 된다.
	//이런식으로 사용시 확장성이 높아진다.
	public static String getSearch(String search) {
		
		try {
			if(search.equals("1")) {
				return "b_no";
			}else if(search.equals("2")) {
				return "b_title";
			}else if(search.equals("3")){
				return "b_writer";
			}else {
				return null;
			}
	
		}catch (NullPointerException e) {
			logger.info("getSearch 메서드 null 발생");
			return null;
		}
	}
}
