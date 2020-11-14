package model.dataroom;

/*
CREATE TABLE DATAROOM(
NO NUMBER PRIMARY KEY,
NAME NVARCHAR2(10) NOT NULL,
TITLE NVARCHAR2(50) NOT NULL,
CONTENT NVARCHAR2(2000) NOT NULL,
POSTDATE DATE DEFAULT SYSDATE,
ATTACHFILE VARCHAR2(50) NOT NULL,
DOWNCOUNT NUMBER DEFAULT 0,
PASSWORD VARCHAR2(10) NOT NULL);
*/
public class DataRoomDTO {
	private String no;
	private String name;
	private	String title;
	private String content;
	private java.sql.Date postDate;
	private String attachFile;
	private String downCount;
	private String password;
	
	
	//getter, setter
	public String getNo() {
		return no;
	}
	public void setNo(String no) {
		this.no = no;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public java.sql.Date getPostDate() {
		return postDate;
	}
	public void setPostDate(java.sql.Date postDate) {
		this.postDate = postDate;
	}
	public String getAttachFile() {
		return attachFile;
	}
	public void setAttachFile(String attachFile) {
		this.attachFile = attachFile;
	}
	public String getDownCount() {
		return downCount;
	}
	public void setDownCount(String downCount) {
		this.downCount = downCount;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	
	
	
	
}
