package kr.ac.kopo.model;

public class BaseVO {
	
private String groupId;
private String orgFileName;
private String refileName;
private String fileSize;
private String fileDir;
private String fileExt;
private String regTs;


public String getOrgFileName() {
	return orgFileName;
}
public void setOrgFileName(String orgFileName) {
	this.orgFileName = orgFileName;
}
public String getRefileName() {
	return refileName;
}
public void setRefileName(String refileName) {
	this.refileName = refileName;
}
public String getGroupId() {
	return groupId;
}
public void setGroupId(String groupId) {
	this.groupId = groupId;
}
public String getFileSize() {
	return fileSize;
}
public void setFileSize(String fileSize) {
	this.fileSize = fileSize;
}
public String getFileDir() {
	return fileDir;
}
public void setFileDir(String fileDir) {
	this.fileDir = fileDir;
}
public String getFileExt() {
	return fileExt;
}
public void setFileExt(String fileExt) {
	this.fileExt = fileExt;
}
public String getRegTs() {
	return regTs;
}
public void setRegTs(String regTs) {
	this.regTs = regTs;
}


}
