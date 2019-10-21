package kr.ac.kopo.model;

import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

public class Board extends BaseVO{
	int bNo;//프로젝트번호
	@NotNull(message="제목을 입력해 주세요")
	@NotEmpty(message="제목을 입력해 주세요")
	@Size(min=2,message="최소 2자리이상 입력해주세요")
	String bTitle;//제목
	String bWriter;//작성자
	String bSummary;//개요
	String bRegTs;//작성일자
	int bViews;//조회수
	char bDelete;//삭제여부
	String bUpdateTs;//수정일자
	String bDeleteTs;//삭제일자
	String bUpdateWriter;//최종수정자
	String bStartTs;//프로젝트 시작일자
	String bEndTs;//프로젝트 종료일자
	String bUserCnt;//프로젝트 참여인원
	String bPurpose;//프로젝트 목적
	String bDb;//프로젝트 사용디비
	String bTool;//프로젝트 사용툴
	String bLanguage;//프로젝트 사용언어
	String bEtc;//프로젝트 기타사항
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

	public String getbSummary() {
		return bSummary;
	}

	public void setbSummary(String bSummary) {
		this.bSummary = bSummary;
	}

	public String getbRegTs() {
		return bRegTs;
	}

	public void setbRegTs(String bRegTs) {
		this.bRegTs = bRegTs;
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

	public String getbUpdateTs() {
		return bUpdateTs;
	}

	public void setbUpdateTs(String bUpdateTs) {
		this.bUpdateTs = bUpdateTs;
	}

	public String getbDeleteTs() {
		return bDeleteTs;
	}

	public void setbDeleteTs(String bDeleteTs) {
		this.bDeleteTs = bDeleteTs;
	}

	public String getbUpdateWriter() {
		return bUpdateWriter;
	}

	public void setbUpdateWriter(String bUpdateWriter) {
		this.bUpdateWriter = bUpdateWriter;
	}

	public String getbStartTs() {
		return bStartTs;
	}

	public void setbStartTs(String bStartTs) {
		this.bStartTs = bStartTs;
	}

	public String getbEndTs() {
		return bEndTs;
	}

	public void setbEndTs(String bEndTs) {
		this.bEndTs = bEndTs;
	}

	public String getbUserCnt() {
		return bUserCnt;
	}

	public void setbUserCnt(String bUserCnt) {
		this.bUserCnt = bUserCnt;
	}

	public String getbPurpose() {
		return bPurpose;
	}

	public void setbPurpose(String bPurpose) {
		this.bPurpose = bPurpose;
	}

	public String getbDb() {
		return bDb;
	}

	public void setbDb(String bDb) {
		this.bDb = bDb;
	}

	public String getbTool() {
		return bTool;
	}

	public void setbTool(String bTool) {
		this.bTool = bTool;
	}

	public String getbLanguage() {
		return bLanguage;
	}

	public void setbLanguage(String bLanguage) {
		this.bLanguage = bLanguage;
	}

	public String getbEtc() {
		return bEtc;
	}

	public void setbEtc(String bEtc) {
		this.bEtc = bEtc;
	}

	//sql 인젝션을 방지하기 위해 jsp에서 1,2,3 이런식으로 값을 주고 해당 값에 대응하는 컬럼을 셋팅 해준다.
	//여기서 리턴된 값이 Pager 클래스의 setSearch에 들어가게 된다.
	//이런식으로 사용시 확장성이 높아진다.
	public static String getSearch(String search) {
		
		//search.equals("1") 이런식으로 search에서 equals 메서드를 호출 하려고 하면
		//search가 null일 경우 오류가 발생하게 된다. 따라서 항상 존재하는 비교값 1에 equals를 걸면 오류가 사라진다.
			if("1".equals(search)) {
				return "b_no";
			}else if("2".equals(search)) {
				return "b_title";
			}else if("3".equals(search)){
				return "b_writer";
			}else {
				return null;
			}
	
	}
}
