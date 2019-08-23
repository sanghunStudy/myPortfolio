package kr.ac.kopo.model;

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
	
	
	
}
