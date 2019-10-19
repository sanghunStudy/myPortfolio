package kr.ac.kopo.model;

public class BaseVO {
	
private String fNo;//첨부파일번호
private String fOName;//첨부파일원본명
private String fPName;//첨부파일 실제이름
private String fVolume;//첨부파일용량
private String fType;//첨부파일타입
private String fDelete;//첨부파일 삭제여부
private String fRegTs;//첨부파일 작성일자
private String fDir;//첨부파일경로

private String userId;//사용자 아이디
private String pw;//비번

public String getUserId() {
	return userId;
}
public void setUserId(String userId) {
	this.userId = userId;
}
public String getPw() {
	return pw;
}
public void setPw(String pw) {
	this.pw = pw;
}
public String getfNo() {
	return fNo;
}
public void setfNo(String fNo) {
	this.fNo = fNo;
}
public String getfOName() {
	return fOName;
}
public void setfOName(String fOName) {
	this.fOName = fOName;
}
public String getfVolume() {
	return fVolume;
}
public void setfVolume(String fVolume) {
	this.fVolume = fVolume;
}
public String getfType() {
	return fType;
}
public void setfType(String fType) {
	this.fType = fType;
}
public String getfDelete() {
	return fDelete;
}
public void setfDelete(String fDelete) {
	this.fDelete = fDelete;
}
public String getfRegTs() {
	return fRegTs;
}
public void setfRegTs(String fRegTs) {
	this.fRegTs = fRegTs;
}
public String getfDir() {
	return fDir;
}
public void setfDir(String fDir) {
	this.fDir = fDir;
}
public String getfPName() {
	return fPName;
}
public void setfPName(String fPName) {
	this.fPName = fPName;
}


}
